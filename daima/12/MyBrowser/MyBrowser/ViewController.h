//
//  ViewController.h
//  MyBrowser


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *addr;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)goTapped:(id)sender;
@end

