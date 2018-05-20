//
//  GCZItemManger.h
//  书签类设计
//
//  Created by 郭丰锐 on 2017/7/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "GCZURLItem.h"
@class GCZURLItem;
@interface GCZItemManger : NSObject
- (BOOL)addBookItems:(GCZURLItem*)item;
- (void)showBookItems;
- (GCZURLItem*)searchItemByURL:(NSString*)url;
//- (GCZURLItem*)searchItemByDate:(NSString*)date;
- (BOOL)deleteItemByURL:(NSString*)url;
- (void) sortItemByTittle;
@end
