//
//  ListEditViewController.h
//  Storyboard Test


#import <UIKit/UIKit.h>

@interface ListEditViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *editText;
@property (copy, nonatomic) NSDictionary *selection; 
@property (weak, nonatomic) id preViewController; 

@end
