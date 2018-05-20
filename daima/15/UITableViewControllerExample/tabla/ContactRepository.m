//
//  ContactRepository.m
//  tabla
//


#import "ContactRepository.h"

@implementation ContactRepository

#pragma mark - Singleton

+ (instancetype)sharedInstance {
    static ContactRepository *sharedInstance = nil;
    static dispatch_once_t dispatchOnceToken;
    
    dispatch_once(&dispatchOnceToken, ^{
        sharedInstance = [[ContactRepository alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Contacts repository implementation

- (NSArray *)contacts {
    
    NSMutableDictionary *persona1 = [NSMutableDictionary new];
    [persona1 setValue:@"Mario" forKey:ContactNameKey];
    [persona1 setValue:@"iOS developer" forKey:ContactJobKey];
    [persona1 setValue:@"https://pbs.twimg.com/profile_images/1391983193/Super-Mario-3DS-nintendo-img1.jpg" forKey:ContactThumbnailKey];
    
    
    NSDictionary *persona2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Sol",ContactNameKey,
                              @"Android developer",ContactJobKey,
                              @"https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/2/000/198/19f/20bb501.jpg", ContactThumbnailKey,
                              nil];
    
    NSDictionary *persona3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Fer",ContactNameKey,
                              @"iOS Developer",ContactJobKey,
                              @"https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/5/005/0af/3cd/01ad9ca.jpg", ContactThumbnailKey,
                              nil];
    
    NSDictionary *persona4 = [NSDictionary dictionaryWithObjectsAndKeys:@"Christian",ContactNameKey,
                              @"PHP Developer",ContactJobKey,
                              @"https://media.licdn.com/media/p/2/000/1b8/3f2/31c8d80.jpg", ContactThumbnailKey,
                              nil];

    
    
    return [NSArray arrayWithObjects:[[ContactModel alloc] initWithDictionary:persona1],
                                    [[ContactModel alloc] initWithDictionary:persona2],
                                    [[ContactModel alloc] initWithDictionary:persona3],
                                    [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],
            [[ContactModel alloc] initWithDictionary:persona1],
            [[ContactModel alloc] initWithDictionary:persona2],
            [[ContactModel alloc] initWithDictionary:persona3],
            [[ContactModel alloc] initWithDictionary:persona4],nil];
}

@end
