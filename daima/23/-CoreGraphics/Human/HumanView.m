//
//  HumanView.m


#import "HumanView.h"
#define r 100
#import <CoreGraphics/CoreGraphics.h>
#import "Circle.h"
#define Color(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
@implementation HumanView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    ///获取当前图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    
//    CGContextTranslateCTM(context,self.frame.size.width/2, self.frame.size.height/2);
//
//
//    NSMutableArray *array = [NSMutableArray array];
//    UIColor *color1 = Color(16,63,236,0.75);
//    UIColor *color2 = Color(37,172,162,0.75);
//    UIColor *color3 = Color(233,124,32,0.75);
//    UIColor *color4 = Color(235,67,35,0.75);
//    UIColor *color5 = Color(190,28,65,0.75);
//    UIColor *color6 = Color(208,57,159,0.75);
//    UIColor *color7 = Color(150,32,198,0.75);
//    UIColor *color8 = Color(95,33,203,0.75);
//    
//    [array addObject:color1];
//    [array addObject:color2];
//    [array addObject:color3];
//    [array addObject:color4];
//    [array addObject:color5];
//    [array addObject:color6];
//    [array addObject:color7];
//    [array addObject:color8];
//    
//    for (int i = 0; i < 8; i ++)
//    {
//        UIColor *tmp = [array objectAtIndex:i];
//        CGContextAddEllipseInRect(context, CGRectMake(-80, 0, 180, 180));
//        CGContextSetFillColorWithColor(context, tmp.CGColor);
//        CGContextRotateCTM(context,  M_PI_4);
//        
//        
//        CGContextFillPath(context);

//        CGContextRotateCTM(context, M_PI * 90 / 360);
//        
//        CGContextAddEllipseInRect(context, rect);
//        //    CGContextSetFillColorWithColor(context, color.CGColor);
//        CGContextFillPath(context);

//    }
    
    
    
    
    
    drawBody(context,rect);
    drawEyy(context,rect);
    drawMouth(context,rect);
}
///画身体
void drawBody(CGContextRef context,CGRect rect)
{
    ///设置颜色
    [[UIColor yellowColor] set];
    
    CGFloat startX = 100;
    CGFloat startY = 120;
    ///将画笔移动到指定位置
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat circleUpX = startX + r;
    CGFloat circleUpY = startY;
    ///画弧，参数分别为图形上下文，圆心x，圆心y，半径，起始弧度，终止弧度，方向(1是顺时针，0是逆时针)
    CGContextAddArc(context, circleUpX, circleUpY, r, 0, M_PI, 1);
    
    CGFloat lineX = circleUpX +r;
    CGFloat lineY = circleUpY;
    ///划线
    CGContextAddLineToPoint(context, lineX, lineY);
    
    CGFloat circleDownX = lineX - r;
    CGFloat circleDownY = lineY + r;
    CGContextAddArc(context, circleDownX, circleDownY, r, 0, M_PI, 0);
    
    ///合并线条
    CGContextClosePath(context);
    ///绘制图形,并填充颜色
    CGContextFillPath(context);
}
///画嘴巴
void drawMouth(CGContextRef context,CGRect rect)
{
    CGFloat mouthStartX = 150;
    CGFloat mouthStartY = 250;
    CGContextMoveToPoint(context, mouthStartX, mouthStartY);
    
    CGFloat mouthEndX = 250;
    CGFloat mouthEndY = 250;
    CGFloat controlX = 200;
    CGFloat controlY = 270;
    ///画贝塞尔曲线，参数分别为图形上下文，控制点x。控制点y，结束点x，结束点y（一个控制点）
    ///两个控制点的方法为CGContextAddCurveToPoint
    CGContextAddQuadCurveToPoint(context, controlX, controlY, mouthEndX, mouthEndY);
    ///设置颜色
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    ///设置线宽
    CGContextSetLineWidth(context, 2);
    ///绘图但只画边框
    CGContextStrokePath(context);
    
}
///画眼睛
void drawEyy(CGContextRef context,CGRect rect)
{
    CGFloat startX = 100;
    CGFloat startY = 120;
    CGContextMoveToPoint(context, startX, startY);
    CGContextSetLineWidth(context, 15);
    
    CGFloat endX = 100 + r * 2;
    CGFloat endY = 120;
    CGContextAddLineToPoint(context, endX, endY);
    
    [[UIColor blackColor] set];

    CGContextStrokePath(context);
    
    
    CGFloat blackEyyX = startX + r;
    CGFloat blackEyyY = startY;
    CGContextAddArc(context, blackEyyX, blackEyyY, r * 0.5, 0, M_PI * 2, 1);
    CGContextFillPath(context);

    CGFloat whiteEyyX = blackEyyX;
    CGFloat whiteEyyY = blackEyyY;
    [[UIColor whiteColor] set];
    CGContextAddArc(context, whiteEyyX, whiteEyyY, r * 0.4, 0, M_PI * 2, 1);
    CGContextFillPath(context);

    CGFloat grayEyyX = blackEyyX;
    CGFloat grayEyyY = blackEyyY;
    [[UIColor grayColor] set];
    CGContextAddArc(context, grayEyyX, grayEyyY, r * 0.2, 0, M_PI * 2, 1);
    
    CGContextFillPath(context);
    

}

@end
