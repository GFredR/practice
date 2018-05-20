//
//  GCZItemManger.m
//  书签类设计
//
//  Created by 郭丰锐 on 2017/7/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "GCZItemManger.h"
#import "GCZURLItem.h"
@interface GCZItemManger()
@property (strong, nonatomic) NSMutableArray* items;
@end
@implementation GCZItemManger
- (instancetype)init
{
    self = [super init];
    if (self) {
        //对象初始化的内存分配原则
        self.items = [NSMutableArray new];
    }
    return self;
}
- (void)showBookItems{
    for (int i; i<self.items.count; i++) {
        NSLog(@"%@",self.items[i]); 
    }
    
}
- (BOOL)addBookItems:(GCZURLItem*)item{
    for (int i; i<self.items.count; i++) {
        GCZURLItem* myItem = self.items[i];
        if ([myItem isEqualToItem:item]) {
            return NO;
        }
    }
    [self.items addObject:item];
    return YES;
}
- (GCZURLItem*)searchItemByURL:(NSString*)url{
    for (int i; i<self.items.count; i++) {
        if ([[self.items[i] url] isEqualToString:url]) {
            return self.items[i];
        }
    }
    return nil;
}
//- (GCZURLItem*)searchItemByDate:(NSString*)date{
    
//    return nil;
//}
- (BOOL)deleteItemByURL:(NSString*)url{
    for (int i; i<self.items.count; i++) {
        if ([[self.items[i] url] isEqualToString:url]) {
            [self.items removeObjectAtIndex:i];
            return YES;
        }
    }
    return NO;
}
- (void) sortItemByTittle{
    [self.items sortUsingSelector:@selector(compareItemByTittle:)];
}
@end
