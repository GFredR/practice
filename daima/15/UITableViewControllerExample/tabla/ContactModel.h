//
//  ContactModel.h
//  tabla


#import <Foundation/Foundation.h>

#define ContactNameKey @"name"
#define ContactJobKey @"job"
#define ContactThumbnailKey @"thumbnail"

@interface ContactModel : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *job;
@property (strong, nonatomic) NSString *workPhone;
@property (strong, nonatomic) NSString *homePhone;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSURL *thumbnail;
@property (strong, nonatomic) NSURL *photo;

- (instancetype)initWithDictionary:(NSDictionary *)contactDictionary;

@end
