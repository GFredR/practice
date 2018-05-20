//
//  Computer.h
//  瞎练1
//
//  Created by 郭丰锐 on 2017/7/6.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Computer : NSObject
{
    NSString* _cname;
    NSString* _cgongneng;
    CGFloat _number1;
    CGFloat _number2;
    CGFloat _compute;
}
-(void)showMessege;
-(NSString *)cGongNeng;
-(CGFloat)compute;
-(void)setCname;
@end
