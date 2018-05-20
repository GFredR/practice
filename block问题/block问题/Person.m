//
//  Person.m
//  block问题
//
//  Created by 郭丰锐 on 2017/7/18.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)studyComplete:(int (^)(NSString* message))completeBlock{
    NSLog(@"很多");
    //调用用户定制的block块
    int sco = completeBlock(@"今天");
    NSLog(@"mssmms%d",sco);
    
}
@end
