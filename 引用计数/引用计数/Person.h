//
//  Person.h
//  引用计数
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Book;
@interface Person : NSObject<NSCopying>

@property(strong, nonatomic)Book* book;

@end
