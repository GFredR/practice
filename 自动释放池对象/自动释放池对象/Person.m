//
//  Person.m
//  自动释放池对象
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
//autorelease会把当前对象加入到最近的释放池内
+ (Person*)personWithName:(NSString*)name{
    Person* p = [[[Person alloc] init] autorelease];
    p.name = name;
    return p;
}

@end
