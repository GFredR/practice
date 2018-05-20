//
//  IntentViewController.m


#import <Intents/Intents.h>
#import "IntentViewController.h"

// As an example, this extension's Info.plist has been configured to handle interactions for INStartWorkoutIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Start my workout using <myApp>"

@interface IntentViewController ()

@end

@implementation IntentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - INUIHostedViewControlling

// Prepare your view controller for the interaction to handle.
- (void)configureWithInteraction:(INInteraction *)interaction context:(INUIHostedViewContext)context completion:(void (^)(CGSize))completion {
    // Do configuration here, including preparing views and calculating a desired size for presentation.
    
    //Testing by Airfly, add a Text label
    INIntent *intent = interaction.intent;
    if ([intent isKindOfClass:[INStartWorkoutIntent class]] ||
        [intent isKindOfClass:[INPauseWorkoutIntent class]] ||
        [intent isKindOfClass:[INResumeWorkoutIntent class]] ||
        [intent isKindOfClass:[INCancelWorkoutIntent class]] ||
        [intent isKindOfClass:[INEndWorkoutIntent class]]) {
        
        UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, [self extensionContext].hostedViewMaximumAllowedSize.height-30, [self extensionContext].hostedViewMaximumAllowedSize.width-20, 20)];
        
        if ([intent isKindOfClass:[INStartWorkoutIntent class]]) {
            [labelTitle setText:NSLocalizedString(@"Start", @"Start (Text from Running)")];
        }
        else if ([intent isKindOfClass:[INPauseWorkoutIntent class]]) {
            [labelTitle setText:NSLocalizedString(@"Pause", @"Pause (Text from Running)")];
        }
        else if ([intent isKindOfClass:[INResumeWorkoutIntent class]]) {
            [labelTitle setText:NSLocalizedString(@"Resume", @"Resume (Text from Running)")];
        }
        else if ([intent isKindOfClass:[INCancelWorkoutIntent class]]) {
            [labelTitle setText:NSLocalizedString(@"Cancel", @"Cancel (Text from Running)")];
        }
        else if ([intent isKindOfClass:[INEndWorkoutIntent class]]) {
            [labelTitle setText:NSLocalizedString(@"End", @"End (Text from Running)")];
        }
        
        [self.view addSubview:labelTitle];
    }
    
    if (completion) {
        completion([self desiredSize]);
    }
}

- (CGSize)desiredSize {
    return [self extensionContext].hostedViewMaximumAllowedSize;
}

@end
