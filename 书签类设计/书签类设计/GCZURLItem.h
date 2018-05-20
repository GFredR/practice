//
//  GCZURLItem.h
//  书签类设计
//
//  Created by 郭丰锐 on 2017/7/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "GCZURLItem.h"
//@class GCZURLItem
@interface GCZURLItem : NSObject
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* tittle;
@property (assign, nonatomic) NSInteger stars;
@property (assign, nonatomic) NSInteger visiters;
@property (strong, nonatomic) NSString* date;
- (BOOL)isEqualToItem:(GCZURLItem*)item;
- (NSComparisonResult)compareItemByTittle:(GCZURLItem*)item;
@end
