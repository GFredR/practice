//
//  UIImage+ResizeImageToSize.h


#import <UIKit/UIKit.h>

@interface UIImage (ResizeImageToSize)

/**
 Scales a given image down to or indeed up to a new CGSize
 
 @param image Image to be scaled
 @param newSize The new size the image is to be scaled to
 @returns UIImage
 */
+(UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

@end
