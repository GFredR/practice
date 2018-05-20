//
//  Perso.m
//  self关键字
//
//  Created by 郭丰锐 on 2017/8/3.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Perso.h"

@implementation Perso
- (void)sayHi{
    NSString* _name;
    NSLog(@"_name = %@",_name);
}
- (void)hehe{
    NSLog(@"'''''");
    //调用当前sayHi方法
   // Perso* p1 = [Perso new];
   // [p1 sayHi];
}
@end
