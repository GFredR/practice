//
//  Video.m
//  XML解析
//
//  Created by 郭丰锐 on 2018/1/31.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "Video.h"

@implementation Video

-(NSString *)time{
    int len = self.length.intValue;
    return [NSString stringWithFormat:@"%02d:%02d:%02d",len/3600,(len%3600)/60,(len%60)];
}
- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)videoWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"<%@:%p>{videoID:%@,name:%@,length:%@,videoURL:%@,imageURL:%@,desc:%@,teacher:%@}",[self class],self.videoId,self.name,self.length,self.videoURL,self.imageURL,self.desc,self.teacher];
}












@end
