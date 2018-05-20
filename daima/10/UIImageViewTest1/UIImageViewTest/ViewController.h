//
//  ViewController.h
//  UIImageViewTest


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *iv1;
@property (strong, nonatomic) IBOutlet UIImageView *iv2;
- (IBAction)plus:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)next:(id)sender;


@end

