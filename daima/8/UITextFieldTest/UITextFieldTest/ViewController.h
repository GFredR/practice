//
//  ViewController.h
//  UITextViewTest


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
- (IBAction)finishEdit:(id)sender;
- (IBAction)backTap:(id)sender;
@end

