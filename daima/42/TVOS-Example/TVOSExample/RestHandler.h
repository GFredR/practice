//
//  RestHandler.h


#import <Foundation/Foundation.h>

@interface RestHandler : NSObject

+ (instancetype)sharedInstance;

- (void)fetchMovies:(void (^)(NSArray *movies))success failure:(void (^)(NSError *error))failure;

@end
