//
//  ContactRepository.h
//  tabla


#import <Foundation/Foundation.h>
#import "ContactModel.h"

@interface ContactRepository : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)contacts;

@end
