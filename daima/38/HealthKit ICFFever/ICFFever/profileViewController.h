//
//  FirstViewController.h


@import UIKit;
@import HealthKit;

@interface profileViewController : UIViewController

@property (nonatomic) HKHealthStore *healthStore;


@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;

- (IBAction)save:(id)sender;

@end

