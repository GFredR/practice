//
//  ViewController.h
//  MCPagerView


#import <UIKit/UIKit.h>
#import "MCPagerView.h"

@interface ViewController : UIViewController <UIScrollViewDelegate, MCPagerViewDelegate> {
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet MCPagerView *pagerView;
}

@end
