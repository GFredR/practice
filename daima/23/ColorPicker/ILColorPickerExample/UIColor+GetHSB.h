

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef struct {
    float hue;
    float saturation;
    float brightness;
} HSBType;

@interface UIColor(GetHSB)

-(HSBType)HSB;

@end
