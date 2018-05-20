//
//  FMStepper.m

#import "FMStepper.h"
#import "FMStepperButton.h"
#import <QuartzCore/QuartzCore.h>


static CGFloat const kFMStepperDefaultAutorepeatInterval = 0.35f; // Default time interval for autorepeat


@interface FMStepper () <UITextFieldDelegate>

@property (strong, nonatomic) FMStepperButton *decreaseStepperButton; // Left FMStepperButton
@property (strong, nonatomic) UITextField     *valueTextField;		  // Center UITextField
@property (strong, nonatomic) FMStepperButton *increaseStepperButton; // Right FMStepperButton

// The current value of the stepper, as an NSNumber. Access through public methods value/setValue.
@property (strong, nonatomic) NSNumber *currentValue;

// The font to be used for the UITextField (valueTextField).
@property (strong, nonatomic) UIFont  *textFont;

// A non-`nil` value indicates that the value is currently being changed and contains the value itself.
@property (strong, nonatomic) NSNumber *valueDuringAction;

// Set the current stepper value and do necessary interface updating and action triggering.
// This  method is private. It is the business.
- (void)setCurrentValue:(NSNumber *)value;

@end


@implementation FMStepper

+ (FMStepper *)stepperWithFrame:(CGRect)frame min:(CGFloat)min max:(CGFloat)max step:(CGFloat)step value:(CGFloat)value
{
	FMStepper *stepper = [[FMStepper alloc] initWithFrame:frame];
	stepper.minimumValue = min;
	stepper.maximumValue = max;
	stepper.stepValue = step;
	stepper.currentValue = @(value);

	return stepper;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {		
		[self commonInit];
	}

	return self;
}

// If frame has zero height and width, then the frame will be set to 79 x 27, as `UIStepper`/`UISwitch`.
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self commonInit];
    }
	
    return self;
}


- (void)commonInit
{
	// Properties: defaults
	
	self.minimumValue = 0;	// All these have the same default values as a UIStepper
	self.maximumValue = 100;
	self.stepValue = 1;
	self.continuous = YES;
	self.autorepeat = YES;
	self.wraps = NO;

	self.autorepeatInterval = kFMStepperDefaultAutorepeatInterval;	// Static value default is defined above
	[self setCurrentValue:@(self.stepValue)];

	// Interface elements
	
	self.backgroundColor = [UIColor clearColor]; // Just in case non-clear in NIB
	
	CGRect frame = self.frame;
	
	// If only a sensible origin is given, then resize the frame to the iOS default.
	if (frame.size.width <= 0 && frame.size.height <= 0) {
		// The bounding rectangle for a UIStepper matches that of a UISwitch object (79 x 27)
		frame = CGRectMake(frame.origin.x, frame.origin.x, 79.0f, 27.0f);
	}

	// The buttons are always square
	CGFloat controlHeight = frame.size.height;
	CGFloat buttonWidth = frame.size.height;
	CGFloat fieldWidth = frame.size.width - (2 * buttonWidth);

	// Use the system font by default; calculate max size from height of frame
	// We don't actually set the title on the button, since the +/- is drawn
	// in the FMStepperButton's drawRect
	self.textFont = [UIFont systemFontOfSize:(0.95 * controlHeight)];

	// LHS Decreasing Stepper Button
	CGRect decreaseStepperFrame = CGRectMake(0.0f, 0.0f, buttonWidth, controlHeight);
	self.decreaseStepperButton = [[FMStepperButton alloc] initWithFrame:decreaseStepperFrame
																  style:FMStepperButtonStyleLeftMinus];
	self.decreaseStepperButton.autoresizingMask = UIViewAutoresizingNone;
	self.decreaseStepperButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[self.decreaseStepperButton addTarget:self
								   action:@selector(buttonPressed:)
						 forControlEvents:UIControlEventTouchUpInside];
	[self.decreaseStepperButton addTarget:self
								   action:@selector(longTouchDidBegin:)
						 forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
	[self.decreaseStepperButton addTarget:self
								   action:@selector(longTouchDidEnd)
						 forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchCancel | UIControlEventTouchDragExit];


	// Center UITextField for stepper Value
	CGRect valueFieldFrame = CGRectMake(buttonWidth, 0.0f,
										fieldWidth, controlHeight);
	self.valueTextField = [[UITextField alloc] initWithFrame:valueFieldFrame];
	self.valueTextField.textColor = [UIColor blackColor];
	self.valueTextField.keyboardType = UIKeyboardTypeNumberPad;
	self.valueTextField.textAlignment = NSTextAlignmentCenter;
	self.valueTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	self.valueTextField.delegate = self;
	self.valueTextField.text = [self.currentValue stringValue];
	self.valueTextField.layer.masksToBounds = YES;
	self.valueTextField.layer.borderColor = [[UIColor colorWithWhite:0.85f alpha:1.0f] CGColor];
	self.valueTextField.layer.borderWidth = 1.0f;
	
	// RHS Increasing Stepper Button
	CGRect increaseStepperFrame = CGRectMake(buttonWidth + fieldWidth, 0.0f,
											 buttonWidth, controlHeight);
	self.increaseStepperButton = [[FMStepperButton alloc] initWithFrame:increaseStepperFrame
																  style:FMStepperButtonStyleRightPlus];
	self.increaseStepperButton.autoresizingMask = UIViewAutoresizingNone;
	self.increaseStepperButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	[self.increaseStepperButton addTarget:self
								   action:@selector(buttonPressed:)
						 forControlEvents:UIControlEventTouchUpInside];
	[self.increaseStepperButton addTarget:self
								   action:@selector(longTouchDidBegin:)
						 forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
	[self.increaseStepperButton addTarget:self
								   action:@selector(longTouchDidEnd)
						 forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchCancel | UIControlEventTouchDragExit];

	// Finish up
	[self setFont:[self.textFont fontName] size:0.0f]; // Important: make sure things get sized properly

	[self addSubview:self.decreaseStepperButton];
	[self addSubview:self.valueTextField];
	[self addSubview:self.increaseStepperButton];
}


#pragma mark - Getting and Setting the Stepper Value


- (NSNumber *)valueObject
{
	return self.currentValue;
}


- (double)value
{
	return [self.currentValue doubleValue];
}


- (void)setValue:(double)value
{
	self.currentValue = @(value);
}


- (void)setCurrentValue:(NSNumber *)value
{
	// If the value is below/above the range, set the value to the min/max
	// TODO: Is this really the desired behavior?
	if ([value doubleValue] < self.minimumValue) {

		_currentValue = @(self.minimumValue);
		NSLog(@"[%@ %@]- Trying to set value (%@) below minimumValue (%f); using minimumValue",
			  NSStringFromClass(self.class), NSStringFromSelector(_cmd), value, self.minimumValue);

	} else if ([value doubleValue] > self.maximumValue) {
		
		_currentValue = @(self.maximumValue);
		NSLog(@"[%@ %@]- Trying to set value (%@) above maximumValue (%f); using maximumValue",
			  NSStringFromClass(self.class), NSStringFromSelector(_cmd), value, self.maximumValue);

	} else {

		// All is well.
		_currentValue = value;
	}

	// Disable buttons if we're at the miniumum or maximum values
	if ([_currentValue doubleValue] <= self.minimumValue) {

		if (!self.wraps) {
			[self.decreaseStepperButton setEnabled:NO];
		}

	} else if (![self.decreaseStepperButton isEnabled]) {

		[self.decreaseStepperButton setEnabled:YES];
	}

	if ([_currentValue doubleValue] >= self.maximumValue) {

		if (!self.wraps) {
			[self.increaseStepperButton setEnabled:NO];
		}

	} else if (![self.increaseStepperButton isEnabled]) {

		[self.increaseStepperButton setEnabled:YES];
	}
	
	self.valueTextField.text = [_currentValue stringValue];
	
	// Let targets know about change to the value so they can perform actions
	[self sendActionsForControlEvents:UIControlEventValueChanged];
}


#pragma mark - Other Setting Methods


- (void)setMinimumValue:(double)minimumValue
{
	if (minimumValue > self.maximumValue) {

		NSString *reason = [NSString stringWithFormat:@"Invalid minimumValue (%f) in light of current maximumValue (%f)",
							minimumValue, self.maximumValue];
		NSException *ex = [NSException exceptionWithName:NSInvalidArgumentException
												  reason:reason
												userInfo:nil];
		@throw ex;
	}

	_minimumValue = minimumValue;
}


- (void)setMaximumValue:(double)maximumValue
{
	if (maximumValue < self.minimumValue) {

		NSString *reason = [NSString stringWithFormat:@"Invalid maximumValue (%f) in light of current minimumValue (%f)",
							self.minimumValue, maximumValue];
		NSException *ex = [NSException exceptionWithName:NSInvalidArgumentException
												  reason:reason
												userInfo:nil];
		@throw ex;
	}

	_maximumValue = maximumValue;
}


- (void)setStepValue:(double)stepValue
{
	NSString *reason = nil;

	if (stepValue <= 0) {

		reason = [NSString stringWithFormat:@"Invalid stepValue (%f). Cannot be zero or negative value.",
				  stepValue];
		
	} else if (stepValue > self.maximumValue) {

		// This is not enforced in UIStepper. Can't think of a reason *not* to enforce it, however unlikely
		// it is that the input would be this insane.
		reason = [NSString stringWithFormat:@"Invalid stepValue (%f). Cannot be greater than the maximum value (%f).",
				  stepValue, self.maximumValue];
	}
	
	if (reason) {
		NSException *ex = [NSException exceptionWithName:NSInvalidArgumentException
												  reason:reason
												userInfo:nil];
		@throw ex;
	}
	
	_stepValue = stepValue;
}


- (void)setAutorepeatInterval:(double)autorepeatInterval
{
	if (autorepeatInterval > 0) {

		_autorepeatInterval = autorepeatInterval;
		self.autorepeat = YES;

	} else if (autorepeatInterval <= 0) {

		_autorepeatInterval = autorepeatInterval;
		self.autorepeat = NO;
	}
}


- (void)setAccessibilityTag:(NSString *)accessibilityTag
{
	_accessibilityTag = accessibilityTag;

	self.valueTextField.accessibilityLabel = [NSString stringWithFormat:@"%@ value", accessibilityTag];
	self.valueTextField.accessibilityHint = [NSString stringWithFormat:@"Edit value of %@", accessibilityTag];

	[self.decreaseStepperButton configureAccessibilityWithTag:accessibilityTag];
	[self.increaseStepperButton configureAccessibilityWithTag:accessibilityTag];
}


#pragma mark - Customizing Appearance


- (void)setFont:(NSString *)fontName size:(CGFloat)size
{
	// This only applies to the text of the UITextField for the stepper value
	UIFont *font = [UIFont fontWithName:fontName size:size];
	if (!font) {
		NSLog(@"[%@ %@]- Could not get specified font with name: %@",
			  NSStringFromClass(self.class), NSStringFromSelector(_cmd), fontName);
	}
	self.textFont = (font) ? font : [UIFont boldSystemFontOfSize:size];

	// Center UITextField for Stepper Value
	self.valueTextField.adjustsFontSizeToFitWidth = YES;
	if (0 < size) {
		self.valueTextField.font = self.textFont;
	} else {
		CGFloat maxFontSize = self.valueTextField.frame.size.height;
		UIFont *fieldFont = nil;
		NSString *textFieldString = (self.valueTextField.text) ? (self.valueTextField.text) : @"5";
		CGSize size = [textFieldString sizeWithFont:[UIFont fontWithName:fontName size:maxFontSize]];
		while (size.height >= self.valueTextField.frame.size.height) {
			maxFontSize --;
			fieldFont = [UIFont fontWithName:fontName size:maxFontSize];
			size = [textFieldString sizeWithFont:fieldFont];
		}
		self.valueTextField.font = [UIFont fontWithName:fontName size:maxFontSize];
	}
}


- (void)setTintColor:(UIColor *)tintColor
{
	_tintColor = tintColor;

	// Update the color of the buttons. They take care of setNeedsDisplay.
	self.increaseStepperButton.color = tintColor;
	self.decreaseStepperButton.color = tintColor;
}


- (void)setCornerRadius:(CGFloat)cornerRadius
{
	self.increaseStepperButton.cornerRadius = cornerRadius;
	self.decreaseStepperButton.cornerRadius = cornerRadius;
}


#pragma mark - User Interface Actions


- (void)buttonPressed:(FMStepperButton *)sender
{
	if (![sender isEnabled]) {
		return;
	}
	
	[sender setHighlighted:YES];

	// If there is currently a long touch in progress, just return
	if (self.valueDuringAction) {
		return;
	}
	
	double changeValue;
	if (sender == self.decreaseStepperButton) {

		changeValue = -1 * self.stepValue;

	} else if (sender == self.increaseStepperButton) {
		
		changeValue = self.stepValue;

	} else {

		NSLog(@"[%@ %@]- Unrecognized sender: %@",
			  NSStringFromClass(self.class), NSStringFromSelector(_cmd), sender);
		return;
	}
	
	self.valueDuringAction = @(changeValue);
	[self performSelector:@selector(incrementValue:) withObject:@(changeValue) afterDelay:0.5];
}


- (void)longTouchDidBegin:(FMStepperButton *)sender
{
	if (![sender isEnabled]) {
		return;
	}
	
	// Dismiss any current keyboard for the UITextField since we're using buttons now
	[self.valueTextField resignFirstResponder];
	
	[sender setHighlighted:YES];

	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	
	double changeValue;
	if (sender == self.decreaseStepperButton) {

		changeValue = -1 * self.stepValue;

	} else if (sender == self.increaseStepperButton) {

		changeValue = self.stepValue;
		
	} else {

		NSLog(@"[%@ %@]- Unrecognized sender: %@",
			  NSStringFromClass(self.class), NSStringFromSelector(_cmd), sender);
		return;
	}

	self.valueDuringAction = @(changeValue);

	if ([self isContinuous]) {

		[self incrementValue:self.valueDuringAction];
	}
	
	[self performSelector:@selector(longTouchInProgress)
			   withObject:nil
			   afterDelay:self.autorepeatInterval];
}


- (void)longTouchDidEnd
{
	[self.decreaseStepperButton setHighlighted:NO];
	[self.increaseStepperButton setHighlighted:NO];
	
	if (![self isContinuous]) {
		
		[self performSelectorOnMainThread:@selector(incrementValue:)
							   withObject:self.valueDuringAction
							waitUntilDone:YES];
	}
	
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	
	self.valueDuringAction = nil;
}


- (void)longTouchInProgress
{
	if (self.autorepeat) {

		[self performSelector:@selector(longTouchInProgress)
				   withObject:nil
				   afterDelay:self.autorepeatInterval];
		
		[self performSelectorOnMainThread:@selector(incrementValue:)
							   withObject:self.valueDuringAction
							waitUntilDone:YES];
	}
}


- (void)incrementValue:(NSNumber *)amount
{
	double amountValue = [amount doubleValue];
	double newValue = [self.currentValue doubleValue] + amountValue;
	
	if (amountValue > 0) {
		
		if (newValue > self.maximumValue) {
			if (!self.wraps) {
				return;
			} else {
				newValue = self.minimumValue;
			}
		}
		
	} else {
		
		if (newValue < self.minimumValue) {
			if (!self.wraps) {
				return;
			} else {
				newValue = self.maximumValue;
			}
		}
	}
	
	self.currentValue = @(newValue);
}


#pragma mark - UITextFieldDelegate Methods


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if (textField == self.valueTextField) {
		
		NSCharacterSet *disallowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] invertedSet];
		
		NSRange disallowedRange = [string rangeOfCharacterFromSet:disallowedChars];

		if (disallowedRange.location != NSNotFound) {
			return NO;
		}

		NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
		[formatter setNumberStyle:NSNumberFormatterNoStyle];
		NSNumber *number = [formatter numberFromString:string];
		if ([number doubleValue] > self.maximumValue || [number doubleValue] < self.minimumValue) {
			return NO;
		}
	}

    return YES;
}



- (void)textFieldDidEndEditing:(UITextField *)textField
{
	NSString *string = textField.text;
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterNoStyle];
	NSNumber *number = [formatter numberFromString:string];

	if ([number doubleValue] > self.maximumValue) {

		self.currentValue = @(self.maximumValue);

	} else if ([number doubleValue] < self.minimumValue) {

		self.currentValue = @(self.minimumValue);
		
	} else {
		
		self.currentValue = [formatter numberFromString:string];
	}
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];

	if ([textField isFirstResponder]) {
		[self endEditing:YES];
	}
	
	return YES;
}

@end
