//
//  MainViewController.h
//  HNExample
//


#import <UIKit/UIKit.h>
#import "HNButton.h"

@interface MainViewController : UIViewController
{
    //Add buttons programmatically
    HNButton * codedButton;
    HNButton * codedButton2;
}

//Or use Storyboard
@property (strong, nonatomic) IBOutlet HNButton *bgColour;
@property (strong, nonatomic) IBOutlet HNButton *bgImage;
@property (strong, nonatomic) IBOutlet HNButton *bgColourIcon;
@property (strong, nonatomic) IBOutlet HNButton *bgImageIcon;
@property (strong, nonatomic) IBOutlet HNButton *withHandler;

@end
