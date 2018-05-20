//
//  GCZURLItem.m
//  书签类设计
//
//  Created by 郭丰锐 on 2017/7/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "GCZURLItem.h"

@implementation GCZURLItem
- (BOOL)isEqualToItem:(GCZURLItem*)item{
    if ([self.tittle isEqualToString:item.tittle] && [self.url isEqualToString:item.url] && self.stars == item.stars && self.visiters == item.visiters && [self.date isEqualToString:item.date] ) {
        return YES;
    }
    return NO;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"\nurl:%@\ntitle:%@\nstars:%ld\nvisiters:%ld\ndate:%@", self.url,self.tittle,self.stars,self.visiters,self.date];
}
- (NSComparisonResult)compareItemByTittle:(GCZURLItem*)item{
    return [self.tittle compare:item.tittle];
}
@end
