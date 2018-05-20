//
//  UINavigationController+Autorotate.h
//  TestLandscape


#import <UIKit/UIKit.h>

@interface UINavigationController (Autorotate)

- (BOOL)shouldAutorotate   ;
- (NSUInteger)supportedInterfaceOrientations;

@end
