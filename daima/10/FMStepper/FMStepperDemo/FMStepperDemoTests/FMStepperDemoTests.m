//
//  FMStepperDemoTests.m


#import "FMStepperDemoTests.h"
#import "FMStepper.h"


@interface FMStepperDemoTests ()

@property (strong, nonatomic) FMStepper *stepper;

@end


@implementation FMStepperDemoTests

- (void)setUp
{
    [super setUp];

	CGRect frame = CGRectMake(0.0f, 0.0f, 200.0f, 120.0f);
	self.stepper = [[FMStepper alloc] initWithFrame:frame];
	self.stepper.minimumValue =  1.0f;
	self.stepper.maximumValue = 10.0f;
	self.stepper.stepValue    =  1.0f;
}

- (void)tearDown
{
	self.stepper = nil;
	
    [super tearDown];
}

- (void)testExceptionOnBadMinimumValue
{
	STAssertThrows([self.stepper setMinimumValue:11.0f],
				   @"FMStepper should have thrown an exception when given a bad minimum value");
}

- (void)testExceptionOnBadMaximumValue
{
	STAssertThrows([self.stepper setMaximumValue:0.0f],
				   @"FMStepper should have thrown an exception when given a bad maximum value");
}

- (void)testExceptionOnNegativeStepValue
{
	STAssertThrows([self.stepper setStepValue:-1.0f],
				   @"FMStepper should have thrown an exception when given a negative step value");
}

- (void)testExceptionOnGreaterThanMaximumStepValue
{
	double newStepValue = self.stepper.maximumValue + 1.0f;
	STAssertThrows([self.stepper setStepValue:newStepValue],
				   @"FMStepper should have thrown an exception when given a too large of a step value");
}

- (void)testSettingValue
{
	[self.stepper setValue:self.stepper.minimumValue];
	double newValue = self.stepper.minimumValue + self.stepper.stepValue;
	[self.stepper setValue:newValue];
	STAssertEquals(self.stepper.value, newValue,
				   @"FMStepper failed to set and get its own value property properly");
}

- (void)testSettingValueBelowRangeValueBecomesUsesMinimum
{
	[self.stepper setValue:(self.stepper.minimumValue - 1.0f)];
	STAssertEquals(self.stepper.value, self.stepper.minimumValue,
				   @"FMStepper should have used the minimum value when asked to set value below minimum");
}

- (void)testSettingValueAboveRangeValueBecomesUsesMaximum
{
	[self.stepper setValue:(self.stepper.maximumValue + 1.0f)];
	STAssertEquals(self.stepper.value, self.stepper.maximumValue,
				   @"FMStepper should have used the maximum value when asked to set value below maximum");
}

@end
