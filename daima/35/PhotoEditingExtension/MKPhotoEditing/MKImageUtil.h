//
//  MKImageUtil.h


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MKImageUtil : NSObject

/**
 *  返回添加滤镜的图片
 *
 *  @param image      原图
 *  @param filterName 滤镜名称
 *
 *  @return 效果图
 */
+ (CIImage *)filterWithOriginalImage:(CIImage *)image
                          filterName:(NSString *)filterName;

/**
 *  返回添加模糊的图片
 *
 *  @param image      原图
 *  @param filterName 滤镜名称
 *  @param radius     模糊值
 *
 *  @return 效果图
 */
+ (CIImage *)blurWithOriginalImage:(CIImage *)image
                          blurName:(NSString *)filterName
                            radius:(NSInteger)radius;

/**
 *  调整图片的饱和度，亮度和对比度
 *
 *  @param image      原图
 *  @param saturation 饱和度
 *  @param brightess  亮度 -1.0 ~ 1.0
 *  @param contrast   对比度
 *
 *  @return 效果图
 */
+ (CIImage *)colorControlsWithOriginalImage:(CIImage *)image
                                 saturation:(CGFloat)saturation
                                  brightess:(CGFloat)brightess
                                   contrast:(CGFloat)contrast;


+ (UIImage *)imageFromCIImage:(CIImage *)ciImage;

//把图片缩放成指定大小
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

@end
