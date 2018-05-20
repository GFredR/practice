//
//  APViewController.m
//  LabelTouch


#import "APViewController.h"

@interface APViewController ()

@end


@implementation APViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

  _myLabel.delegate = self;
}


// +---------------------------------------------------------------------------+
#pragma mark - Delegate
// +---------------------------------------------------------------------------+



- (void)didLetterFound:(char)letter
{
  _LetterFound.text = [NSString stringWithFormat:@"%c", letter];
}


@end
