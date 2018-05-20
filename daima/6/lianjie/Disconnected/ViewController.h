//
//  ViewController.h
//  Disconnected
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (strong, nonatomic) IBOutlet UIWebView *flowerView;
@property (strong, nonatomic) IBOutlet UILabel *chosenColor;

-(IBAction)getFlower:(id)sender;

@end
