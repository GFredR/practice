/*
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 
  Test instance which holds the test name details and the selector which should be invoked to perform the test.
  
 */

#import "AAPLTest.h"

@implementation AAPLTest

- (instancetype)initWithName:(NSString *)name details:(NSString *)details selector:(SEL)method
{
    if (self = [super init]) {
        _name = name;
        _details = details;
        _method = method;
    }
    
    return self;
}

@end
