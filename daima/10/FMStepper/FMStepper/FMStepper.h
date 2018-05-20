//
//  FMStepper.h


#import <UIKit/UIKit.h>


/**
  The `FMStepper` control is a nearly one-to-one replacment for [UIStepper](http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIStepper_Class/Reference/Reference.html) with the following differences:

  - It has a `UITextField` centered between the stepper buttons
    in order that one can view the current value and modify it using the keyboard.
  - The control is easily resized to fit any given frame.
  - It requires no `set[*]ImageForState:` methods for appearance customization.
  
  This control was first inspired by [PAStepper](https://github.com/mperovic/PAStepper)
  and incorporates a ideas (and code) from that project.
  The `FMStepper` control differs in at lesat these respects:

  - It uses a `UITextField` rather than a `UILabel` to display the current value.
  - It accomodates custom fonts and colors wihtout image assets.
  - It is resizable.
  */
@interface FMStepper : UIControl


/** @name Configuring the Stepper (UIStepper equivalents) */


/**
 As in UIStepper: "The tint color for the stepper control...
	The value of this property is nil by default."
	(But the `FMStepperButton` has its own default of `UIColor darkGrayColor`.)
 */
@property (strong, nonatomic) UIColor *tintColor;


/**
 As in UIStepper: "The lowest possible numeric value for the stepper...
	Must be numerically less than maximumValue.
	If you attempt to set a value equal to or greater than maximumValue,
	the system raises an `NSInvalidArgumentException` exception.
	The default value for this property is 0."
 */
@property (assign, nonatomic) double minimumValue;


/**
 As in UIStepper: "The highest possible numeric value for the stepper...
	Must be numerically greater than minimumValue.
	If you attempt to set a value equal to or lower than minimumValue,
	the system raises an `NSInvalidArgumentException` exception.
	The default value of this property is 100."
 */
@property (assign, nonatomic) double maximumValue;


/**
 As in UIStepper: "The step, or increment, value for the stepper...
	Must be numerically greater than 0. If you attempt to set this property’s value
	to 0 or to a negative number, the system raises an NSInvalidArgumentException exception.
	The default value for this property is 1."
 `FMStepper` adds the additional constraint that stepValue must not exceed the maximumValue,
	raising an NSInvalidArgumentException exception in that case.
 */
@property (assign, nonatomic) double stepValue;


/**
 As in UIStepper: "The continuous vs. noncontinuous state of the stepper....
	If YES, value change events are sent immediately when the value changes during user interaction.
	If NO, a value change event is sent when user interaction ends.
	The default value for this property is YES."
 */

@property (assign, nonatomic, getter=isContinuous) BOOL continuous;


/**
 As in UIStepper: "The wrap vs. no-wrap state of the stepper...
	If YES, incrementing beyond maximumValue sets value to minimumValue;
	likewise, decrementing below minimumValue sets value to maximumValue.
	If NO, the stepper does not increment beyond maximumValue nor
	does it decrement below minimumValue but rather holds at those values.
	The default value for this property is NO.
 */
@property (assign, nonatomic) BOOL wraps;


/**
 As in UIStepper: "The automatic vs. nonautomatic repeat state of the stepper...
	If YES, the user pressing and holding on the stepper repeatedly alters value.
	The default value for this property is YES."
 */
@property (assign, nonatomic) BOOL autorepeat;


///----------------------------------------------------------
/// @name Configuring the Stepper (non-UIStepper equivalents)
///----------------------------------------------------------


/**
 The time interval for autorepeat. The default is 0.35s.
 */
@property (assign, nonatomic) double autorepeatInterval;


/**
 The tag to be used in accessibility descriptions (label, hint, value).
 */
@property (copy, nonatomic) NSString *accessibilityTag;


///------------------------------------
/// @name Accessing the Stepper’s Value
///------------------------------------


/**
 Set the current value of the stepper control.
 @param value The value for the stepper.
 */
- (void)setValue:(double)value;

/**
 Get the current value of the stepper control as a `double` primitive.
 @return The current `double` value of the control.
 */
- (double)value;


/**
 Get the current value of the stepper control as an `NSNumber` object.
 @return An `NSNumber` object containing the current value of the control.
 */
- (NSNumber *)valueObject;


///-------------------------
/// @name Creating a Stepper
///-------------------------


/**
 Class method to create an FMStepper.
	If frame has zero height and width, then the frame will be set to 79 x 27,
	which is the default frame size for `UIStepper` and `UISwitch`.
 @param frame If frame has zero height and width, then the frame will be set to 79 x 27, as `UIStepper`/`UISwitch`.
 @param min The minimum value the user should be able to set.
 @param max The maximum value the user should be able to set.
 @param step The increment, or step value, that the control should use.
 @param value The initial value for the control.
 @return An FMStepper object, or `nil` if an error occurred.
 */
+ (FMStepper *)stepperWithFrame:(CGRect)frame min:(CGFloat)min max:(CGFloat)max step:(CGFloat)step value:(CGFloat)value;


///-----------------------------
/// @name Customizing Appearance
///-----------------------------


/**
 Set the font of the UITextField. Does not affect the size of the labels on the stepper buttons.
 @param fontName The name of the font to be used in the `UITextField` element of the control. If fontName cannot be found (e.g., is not available on the current OS version) then `UIFont`'s `boldSystemFontOfSize:` will be used.
 @param size The size of the font to be used.
 */
- (void)setFont:(NSString *)fontName size:(CGFloat)size;


/**
 Set the cornerRadius of the outer two corners of the two stepper buttons.
 @param cornerRadius The corner radius.
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;

@end
