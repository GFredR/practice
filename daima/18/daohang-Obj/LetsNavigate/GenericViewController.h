//
//  GenericViewController.h



#import <UIKit/UIKit.h>
#import "CountingNavigationController.h"

@interface GenericViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *countLabel;

- (IBAction)incrementCount:(id)sender;

@end
