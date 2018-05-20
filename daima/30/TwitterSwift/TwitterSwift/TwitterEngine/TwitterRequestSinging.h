//
//  TwitterRequestSinging.h
//  TwitterEngine

#import <Foundation/Foundation.h>
@interface TwitterRequestSinging : NSObject

+ (void)signRequest:(NSMutableURLRequest *)request withToken:(NSString *)tokenString tokenSecret:(NSString *)tokenSecretString verifier:(NSString *)verifierString key:(NSString *)key secret:(NSString *)theSecret;

@end
