//
//  ViewController.h


#import <UIKit/UIKit.h>
#import "DateChooserViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean dateChooserVisible;

- (IBAction)showDateChooser:(id)sender;
- (void)calculateDateDifference:(NSDate *)chosenDate;

@end
