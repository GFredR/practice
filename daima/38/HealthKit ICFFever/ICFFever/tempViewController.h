//
//  SecondViewController.h


@import UIKit;
@import HealthKit;

@interface tempViewController : UIViewController

@property (nonatomic) HKHealthStore *healthStore;


@property (weak, nonatomic) IBOutlet UITextField *tempTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSegmentedController;

@property (weak, nonatomic) IBOutlet UILabel *recentTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *highestTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowestTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *avgTempLabel;


- (IBAction)save:(id)sender;
- (IBAction)updateUnits:(id)sender;

@end

