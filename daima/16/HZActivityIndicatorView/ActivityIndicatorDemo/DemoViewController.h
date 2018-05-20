//
//  DemoViewController.h
//  ActivityIndicatorDemo


#import <UIKit/UIKit.h>
#import "HZActivityIndicatorView.h"

@interface DemoViewController : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet HZActivityIndicatorView *customIndicator;
@property (unsafe_unretained, nonatomic) IBOutlet UIActivityIndicatorView *nativeIndicator;

@end
