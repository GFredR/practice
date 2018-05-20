//
//  ViewController.h


#import <UIKit/UIKit.h>
#import "HGForceTouchView.h"

@interface ViewController : UIViewController <HGForceTouchViewDelegate>
@property (nonatomic, retain) IBOutlet HGForceTouchView *forceTouchView;
@end

