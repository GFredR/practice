//
//  Computer.m
//  瞎练1
//
//  Created by 郭丰锐 on 2017/7/6.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Computer.h"

@implementation Computer
-(void)showMessege{
    NSLog(@"computer's messege is",_cname,_cgongneng);
}
-(NSString *)cGongNeng{
    NSLog(@"_cgongneng is",_cgongneng);
    return _cgongneng;
}
-(CGFloat)compute{
    _compute=_number1*_number2;
    NSLog(@"result is ",_compute);
    return _compute;
}
-(void)setCname:(NSString*)name{
    _cname=name;
}
-(NSString*)Cname:(NSString*)name{
    return _cname;
}
-(void)setCompute: Number1:(CGFloat)number1 Number2:(CGFloat)number2 Compute:(CGFloat)compute{
    _number1=number1;
    _number2=number2;
    _compute=compute;
}
@end
