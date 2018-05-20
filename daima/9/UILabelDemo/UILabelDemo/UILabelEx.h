

#import <UIKit/UIKit.h>

typedef enum {
    
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface UILabelEx : UILabel
{
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic, assign) VerticalAlignment verticalAlignment;

@end
