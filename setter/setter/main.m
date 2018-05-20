//
//  main.m
//  setter
//
//  Created by 郭丰锐 on 2017/7/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Duocan.h"
@interface Person : NSObject
{
    NSString* _name;
    NSInteger _age;
}
- (void)testFucn;
- (NSString*)name;
- (void)setName:(NSString*)name;
@end
@implementation Person

- (void)testFucn{
    _age=23;
    NSLog(@"age=%ld",_age);
}
- (NSString*)name{
    //_name=@"namedancer";
    return _name;
}
- (void)setName:(NSString*)name{
    _name=name;
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Person* p1=[Person new];
        [p1 testFucn];
        NSString* name=[p1 name];
        NSLog(@"name is %@",name);
        [p1 setName:@"sb"];
        name =[p1 name];
        NSLog(@"name is %@",name);
        Duocan* d1=[Duocan new];
        [d1 sum:22 number2:5555 number3:44444423];
    }
    return 0;
}
