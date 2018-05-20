//
//  Movie.h


#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *movieDescription;
@property (nonatomic, copy) NSURL *imageURL;

@end
