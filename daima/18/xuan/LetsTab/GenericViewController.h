//
//  GenericViewController.h


#import <UIKit/UIKit.h>
#import "CountingTabBarController.h"

@interface GenericViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) IBOutlet UITabBarItem *barItem;
- (IBAction)incrementCountFirst:(id)sender;
- (IBAction)incrementCountSecond:(id)sender;
- (IBAction)incrementCountThird:(id)sender;

-(void)updateCounts;
-(void)updateBadge;

@end
