//
//  MKImageUtil.m


#import "MKImageUtil.h"

@implementation MKImageUtil


+ (CIImage *)filterWithOriginalImage:(CIImage *)image
                          filterName:(NSString *)filterName
{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:image forKey:kCIInputImageKey];
    CIImage *result = [filter valueForKey: kCIOutputImageKey];
    
    return result;
}


+ (CIImage *)blurWithOriginalImage:(CIImage *)image
                          blurName:(NSString *)filterName
                            radius:(NSInteger)radius
{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:image forKey:kCIInputImageKey];
    
    //中值模糊不需要设置
    if(![@"CIMedianFilter" isEqualToString:filterName]){
        [filter setValue:@(radius) forKey:kCIInputRadiusKey];
    }
    
    CIImage *result = [filter valueForKey: kCIOutputImageKey];
    return result;
}


+ (CIImage *)colorControlsWithOriginalImage:(CIImage *)image
                                 saturation:(CGFloat)saturation
                                  brightess:(CGFloat)brightess
                                   contrast:(CGFloat)contrast
{
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    
    [filter setValue: image forKey: kCIInputImageKey];
    [filter setValue: @(saturation) forKey: kCIInputSaturationKey];
    [filter setValue: @(brightess) forKey: kCIInputBrightnessKey];
    [filter setValue: @(contrast) forKey: kCIInputContrastKey];
    
    
    CIImage *result = [filter valueForKey: kCIOutputImageKey];
    return result;
}

+ (UIImage *)imageFromCIImage:(CIImage *)ciImage
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:ciImage
                                       fromRect:[ciImage extent]];
    UIImage *resultImage = [UIImage imageWithCGImage: cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}

+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size
{
    UIImage *resultImage = nil;
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:(CGRect){CGPointZero, size}];
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return resultImage;
}

@end
