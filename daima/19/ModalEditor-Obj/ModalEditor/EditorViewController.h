//
//  EditorViewController.h
//  ModalEditor
//


#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface EditorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)dismissEditor:(id)sender;
@end
