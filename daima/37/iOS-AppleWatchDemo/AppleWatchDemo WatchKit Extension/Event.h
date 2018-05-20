//
//  Event.h


#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, strong) NSString *eventTitle;
@property (nonatomic, strong) NSString *eventTime;
@property (nonatomic, strong) NSString *eventImageName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)eventsList;

@end



