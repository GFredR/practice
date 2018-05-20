//
//  GodMan.h
//  反向委托
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface GodMan : NSObject<LookHomeDelegate>
- (void)goAway;
@end
