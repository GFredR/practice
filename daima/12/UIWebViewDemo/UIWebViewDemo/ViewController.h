//
//  ViewController.h
//  UIWebViewDemo


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    UIActivityIndicatorView* activityIndicator;
    UIWebView* _webView;
    UISlider* Slide;
}
-(void)SlideChange;
@end
