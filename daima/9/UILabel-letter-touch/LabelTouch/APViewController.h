//
//  APViewController.h
//  LabelTouch


#import <UIKit/UIKit.h>
#import "APLabel.h"


@interface APViewController : UIViewController <APLabelDelegate>
{
  IBOutlet UILabel *_LetterFound;
  IBOutlet APLabel *_myLabel;
}

@end
