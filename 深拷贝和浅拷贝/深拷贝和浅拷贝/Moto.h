//
//  Moto.h
//  深拷贝和浅拷贝
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Moto : NSObject<NSCopying>
@property(strong, nonatomic)NSString* name;

@end
