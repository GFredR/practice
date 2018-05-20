//
//  APScrollView.h
//  APExtendedScrollView


#import <UIKit/UIKit.h>

@interface APScrollView : UIScrollView {
    UIPageControl           * _statusBarPageControl;
    UIInterfaceOrientation    _lastOrientation;
}

@end
