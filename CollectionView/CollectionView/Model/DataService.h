//
//  DataService.h
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/19.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject
@property(strong,nonatomic) NSMutableArray *dataSource;
+ (NSArray *)dataSource;
+ (NSArray*)imgSource;
@end
