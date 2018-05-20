//
//  UIImage+UISegmentedControlIconAndText.m
//  UISegmentedControl_IconAndText

#import "UIImage+UISegmentedControlIconAndText.h"

@implementation UIImage (UISegmentedControlIconAndText)

+ (id)imageFromImage:(UIImage *)image string:(NSString *)string font:(UIFont *)font color:(UIColor *)color
{
	CGSize expectedTextSize = [string sizeWithAttributes:@{NSFontAttributeName: font}];
	CGFloat width = expectedTextSize.width + image.size.width;
	CGFloat height = MAX(expectedTextSize.height, image.size.width);
	CGSize size = CGSizeMake(width, height);
	
	UIGraphicsBeginImageContextWithOptions(size, NO, 0);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, color.CGColor);
	
	CGFloat fontTopPosition = (height - expectedTextSize.height) * 0.5;
	CGPoint textPoint = CGPointMake(0, fontTopPosition);
	[string drawAtPoint:textPoint withAttributes:@{NSFontAttributeName: font}];
	
	CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, size.height);
	CGContextConcatCTM(context, flipVertical);
	CGContextDrawImage(context, (CGRect){ {expectedTextSize.width, (height - image.size.height) * 0.5}, {image.size.width, image.size.height} }, [image CGImage]);
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

@end
