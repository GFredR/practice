//
//  FMStepperDemoViewController.m

#import "FMStepperDemoViewController.h"
#import "FMStepper.h"


@interface FMStepperDemoViewController ()

@property (strong, nonatomic) FMStepper *stepper1;
@property (strong, nonatomic) FMStepper *stepper2;
@property (strong, nonatomic) FMStepper *stepper3;

@end


@implementation FMStepperDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	CGRect screenBounds = [[UIScreen mainScreen] bounds];

	// Stepper 1: All defaults
	CGFloat controlWidth1 = 79.0f;
	CGFloat controlHeight1 = 27.0f;

	CGFloat xPos1 = (0.5 * screenBounds.size.width)  - (.5 * controlWidth1);
	CGFloat yPos1 = (0.25 * screenBounds.size.height)  - (.5 * controlHeight1);
	CGRect frame1 = CGRectMake(xPos1, yPos1, controlWidth1, controlHeight1);

	self.stepper1 = [FMStepper stepperWithFrame:frame1 min:0 max:10 step:1 value:5];
	[self.stepper1 setAccessibilityTag:@"Random"];
	[self.stepper1 addTarget:self
					  action:@selector(stepperChanged:)
			forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:self.stepper1];


	// Stepper 2: Avenir font, reddish color, square corners, step value of 5.0.
	CGFloat controlWidth2 = 109.0f;
	CGFloat controlHeight2 = 32.0f;

	CGFloat xPos2 = (0.5 * screenBounds.size.width)  - (.5 * controlWidth2);
	CGFloat yPos2 = (0.5 * screenBounds.size.height)  - (.5 * controlHeight2);
	CGRect frame2 = CGRectMake(xPos2, yPos2, controlWidth2, controlHeight2);

	self.stepper2 = [FMStepper stepperWithFrame:frame2 min:0.0f max:100.0f step:5.0f value:50.0f];
	[self.stepper2 setFont:@"HelveticaNeue-Light" size:24.0f];
	UIColor *cardinal = [UIColor colorWithRed:(108/255.0f) green:(22/255.0f) blue:(31/255.0f) alpha:1.0];
	[self.stepper2 setTintColor:cardinal];
	[self.stepper2 setCornerRadius:0.0f];
	[self.stepper2 setAccessibilityTag:@"Cardinal"];
	[self.stepper2 addTarget:self
					  action:@selector(stepperChanged:)
			forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:self.stepper2];


	// Stepper 3: Blue color, very round corners, wraps around
	CGFloat controlWidth3 = 180.0f;
	CGFloat controlHeight3 = 60.0f;

	CGFloat xPos3 = (0.5 * screenBounds.size.width)  - (.5 * controlWidth3);
	CGFloat yPos3 = (0.75 * screenBounds.size.height)  - (.5 * controlHeight3);
	CGRect frame3 = CGRectMake(xPos3, yPos3, controlWidth3, controlHeight3);

	self.stepper3 = [FMStepper stepperWithFrame:frame3 min:0.0f max:5.0f step:1.0f value:1.0f];
	self.stepper3.wraps = YES;
	[self.stepper3 setAccessibilityTag:@"Blue"];
	[self.stepper3 setTintColor:[UIColor blueColor]];
	[self.stepper3 setCornerRadius:20.0f];
	[self.stepper3 addTarget:self
					  action:@selector(stepperChanged:)
			forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:self.stepper3];
}


- (void)stepperChanged:(id)sender
{
	if (![sender isMemberOfClass:[FMStepper class]]) {
		NSLog(@"%@ expected an `FMStepper' as sender but got a(n) `%@'. How confusing!",
			  NSStringFromSelector(_cmd), NSStringFromClass([sender class]));
		return;
	}

	FMStepper *stepper = (FMStepper *)sender;
	CGFloat value = [stepper value];

	if (stepper == self.stepper1) {
		NSLog(@"self.stepper1 has value %f", value);
	} else if (stepper == self.stepper2) {
		NSLog(@"self.stepper2 has value %f", value);
	} else if (stepper == self.stepper3) {
		NSLog(@"self.stepper3 has value %f", value);
	} else {
		NSLog(@"Weird. I've never heard of this stepper: %@", stepper);
	}
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

	self.stepper1 = nil;
	self.stepper2 = nil;
	self.stepper3 = nil;
}


@end
