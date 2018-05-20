//
//  Circle.m


#import "Circle.h"
#define Color(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]

@implementation Circle


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    ///获取当前图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *array = [NSMutableArray array];
    UIColor *color1 = Color(16,63,236,0.75);
    UIColor *color2 = Color(37,172,162,0.75);
    UIColor *color3 = Color(233,124,32,0.75);
    UIColor *color4 = Color(235,67,35,0.75);
    UIColor *color5 = Color(190,28,65,0.75);
    UIColor *color6 = Color(208,57,159,0.75);
    UIColor *color7 = Color(150,32,198,0.75);
    UIColor *color8 = Color(95,33,203,0.75);
    
    [array addObject:color1];
    [array addObject:color2];
    [array addObject:color3];
    [array addObject:color4];
    [array addObject:color5];
    [array addObject:color6];
    [array addObject:color7];
    [array addObject:color8];
    
    CGContextSaveGState(context);
    
    ///设置绘图中心点的位置，若不设置，则图形围绕界面左上角进行旋转
    CGContextTranslateCTM(context,self.frame.size.width/2, self.frame.size.height/2);
    for (int i = 0; i < 8; i ++)
    {
        UIColor *tmp = [array objectAtIndex:i];
        ///画圆，rect的参数值前两个，代表着距离上面设置的点的差距
        CGContextAddEllipseInRect(context, CGRectMake(-80, 0, 150, 150));
        CGContextSetFillColorWithColor(context, tmp.CGColor);
        ///旋转的代码
        CGContextRotateCTM(context,  M_PI_4);
        ///设置阴影
        CGContextSetShadow(context, CGSizeMake(2, 1), 0.4);
        
        CGContextFillPath(context);
    }

    for (int i = 0 ; i < 4; i++)
    {
        UIColor *color = [array objectAtIndex:i];
        CGContextAddEllipseInRect(context, CGRectMake(-140, -140, 50, 50));
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextRotateCTM(context, -M_PI_2);
        CGContextSetShadowWithColor(context, CGSizeMake(2, 1), 0.4, color.CGColor);

        CGContextFillPath(context);
    }
    
//    CGContextRestoreGState(context);
    
    for (int i = 0; i < 4; i++)
    {
        UIColor *tmpColor = [array objectAtIndex:i+4];

        CGContextMoveToPoint(context, -130, 0);
        CGContextAddLineToPoint(context, -155, 25);
        CGContextAddLineToPoint(context, -180, 0);
        CGContextAddLineToPoint(context, -155, -25);
        CGContextClosePath(context);
        
        
        CGContextSetFillColorWithColor(context, tmpColor.CGColor);
        CGContextRotateCTM(context, -M_PI_2);
        
        CGContextSetShadowWithColor(context, CGSizeMake(2, 1), 0.4, tmpColor.CGColor);
        
        CGContextFillPath(context);

    }
    
//    CGContextRestoreGState(context);
//    CGContextAddRect(context, CGRectMake(-100, -100, 200, 200));
//    CGContextSetFillColorWithColor(context, Color(29,2,56,0.75).CGColor);
//    
//    CGContextFillPath(context);
    
//    
//    NSString *string = @"The epicenter of chage.";
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
//    [dict setObject:[UIFont systemFontOfSize:28.0f] forKey:NSFontAttributeName];
//    [dict setObject:NSTextAlignmentCenter forKey:NSAttachmentAttributeName];
//    [string drawInRect:CGRectMake(-80, -80, 180, 180) withAttributes:dict];
}


@end
