

#import "UILabelEx.h"

//自定义UILabel.可以竖向设置文本显示位置


@implementation UILabelEx

@synthesize verticalAlignment = _verticalAlignment;

-(id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    
    return  self;
}

-(void) setVerticalAlignment:(VerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
    
    [self setNeedsDisplay];
}

-(CGRect) textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
            
        case VerticalAlignmentTop:
            
            textRect.origin.y = bounds.origin.y;
            
            break;
            
        case VerticalAlignmentBottom:
            
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            
            break;
            
        case VerticalAlignmentMiddle:
            
            // Fall through.
            
        default:
            
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    
    return  textRect;
}

-(void) drawTextInRect:(CGRect)rect
{
    CGRect realRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:realRect];    
}

@end
