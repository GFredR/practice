//
//  Person.h
//  block问题
//
//  Created by 郭丰锐 on 2017/7/18.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
- (void)studyComplete:(int (^)(NSString* message))completeBlock;

@end
