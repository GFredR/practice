//
//  main.m
//  cs
//
//  Created by 郭丰锐 on 2017/11/27.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p = [[Person alloc]init];
        [p setName:@"a"];
        [p setSex:@"f"];
        [p setAge:20];
        [p setEScore:20];
        Person* p1 = [[Person alloc]init];
        [p1 setName:@"x"];
        [p1 setSex:@"f"];
        [p1 setAge:20];
        [p1 setEScore:70];
        Person* p2 = [[Person alloc]init];
        [p2 setName:@"v"];
        [p2 setSex:@"f"];
        [p2 setAge:20];
        [p2 setEScore:55];
        Person* p3 = [[Person alloc]init];
        [p3 setName:@"z"];
        [p3 setSex:@"f"];
        [p3 setAge:20];
        [p3 setEScore:60];
        NSMutableArray* muArr = [NSMutableArray arrayWithCapacity:4];
        [muArr addObject:p];
        [muArr addObject:p1];
        [muArr addObject:p2];
        [muArr addObject:p3];
        float max = 0;
        int m = 0;
        for (int i = 0; i< [muArr count]; i++) {
            Person* str = [muArr objectAtIndex:i];
            //float s = [str floatValue];
            if (str.eScore>max) {
                max = str.eScore;
                m = i;
                Person* str1 = [muArr objectAtIndex:m];
                
            }
            
        }
        NSLog(@"%@",[(Person*)muArr[m] name]);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
