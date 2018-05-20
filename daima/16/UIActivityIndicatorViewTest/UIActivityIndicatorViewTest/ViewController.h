//
//  ViewController.h
//  UIActivityIndicatorViewTest
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIActivityIndicatorView) NSArray *indicators;
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
@end

