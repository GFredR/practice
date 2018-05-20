//
//  main.m
//  数组排序
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray* dataSouse = [[NSMutableArray alloc]init/*initWithObjects:@"45",@"8",@"55",@"1",@"7",@"6", nil*/];
        Student* s1 = [Student new];
        s1.name = @"lallll";
        s1.age = 19;
        Student* s2 = [Student new];
        s2.name = @"amzmmz";
        s2.age = 22;
        Student* s3 = [Student new];
        s3.name = @"amzmmzaa";
        s3.age = 22;
        Student* s4 = [Student new];
        s4.name = @"llllllamzmmz";
        s4.age = 32;
        [dataSouse addObject:s1];
        [dataSouse addObject:s2];
        [dataSouse addObject:s3];
        [dataSouse addObject:s4];
        
      //  SEL action = @selector(compareStudent:);
      //   [dataSouse sortUsingSelector:action];
        NSSortDescriptor* ageDesc = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
        NSSortDescriptor* nameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
        [dataSouse sortUsingDescriptors:@[ageDesc,nameDesc]];
        NSLog(@"%@",dataSouse);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
