//
//  Video.h
//  XML解析
//
//  Created by 郭丰锐 on 2018/1/31.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(strong, nonatomic)NSNumber* videoId;
@property(strong, nonatomic)NSString* name;
@property(strong, nonatomic)NSNumber* length;
@property(strong, nonatomic)NSString* videoURL;
@property(strong, nonatomic)NSString* imageURL;
@property(strong, nonatomic)NSString* desc;
@property(strong, nonatomic)NSString* teacher;
@property(nonatomic, readonly)NSString* time;

- (instancetype)initWithDict:(NSDictionary*)dict;
+ (instancetype)videoWithDict:(NSDictionary*)dict;
@end
