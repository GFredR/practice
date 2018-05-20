//
//  ContactModel.m
//  tabla


#import "ContactModel.h"

@implementation ContactModel

- (instancetype)initWithDictionary:(NSDictionary *)contactDictionary {
    
    self = [super init];
    
    if(!self)
        return nil;
    
    self.name = [contactDictionary valueForKey:ContactNameKey];
    self.job = [contactDictionary valueForKey:ContactJobKey];
    self.thumbnail = [NSURL URLWithString:[contactDictionary valueForKey:ContactThumbnailKey]];
    
    return self;
}

@end
