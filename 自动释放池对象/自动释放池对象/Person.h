//
//  Person.h
//  自动释放池对象
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(copy,nonatomic)NSString* name;
+ (Person*)personWithName:(NSString*)name;

@end
