//
//  DataService.m
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/19.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "DataService.h"

@implementation DataService
+ (NSArray *)dataSource{

    NSArray* dada = [self parseJson:@"news_list"];

    return dada;
}
+ (NSArray*)imgSource{
    NSArray* dada = [self parseJson:@"image_list"];
    
    return dada;
}
+ (id)parseJson:(NSString*)jsonName{
    NSString* filePath = [[NSBundle mainBundle]pathForResource:jsonName ofType:@"json"];
    //
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    //
    NSArray* dataArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dataArr;
}
@end
