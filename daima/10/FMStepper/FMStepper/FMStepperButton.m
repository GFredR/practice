//
//  FMStepperButton.m
#import "FMStepperButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+FMStepperAdditions.h"


@interface FMStepperButton ()

// The style (left, right) of the button, used in deciding which corners to round
@property (nonatomic) FMStepperButtonStyle style;

// Since we dim the button at times, currentColor is the property that drawRect actually reads.
@property (strong, nonatomic) UIColor *currentColor;

@end


@implementation FMStepperButton

- (id)initWithFrame:(CGRect)frame style:(FMStepperButtonStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
		self.style = style;
		self.cornerRadius = 0.2f * frame.size.height; // Currently 20% of frame height
		self.color = [UIColor darkGrayColor]; // This also sets currentColor property
		self.backgroundColor = [UIColor clearColor];
    }
	
    return self;
}


- (void)configureAccessibilityWithTag:(NSString *)tag
{
	switch (self.style) {
		case FMStepperButtonStyleLeftMinus:
			self.accessibilityLabel = [NSString stringWithFormat:@"Decrement %@ button",
									   (tag && [tag length]) ? tag : @"stepper"];
			self.accessibilityHint = [NSString stringWithFormat:@"Decrement %@ value",
									  (tag && [tag length]) ? tag : @"stepper"];
			break;
		case FMStepperButtonStyleRightPlus:
			self.accessibilityLabel = [NSString stringWithFormat:@"Increment %@ button",
									   (tag && [tag length]) ? tag : @"stepper"];
			self.accessibilityHint = [NSString stringWithFormat:@"Increment %@ value",
									  (tag && [tag length]) ? tag : @"stepper"];
		default:
			break;
	}
}


// This also sets the currentColor property
- (void)setColor:(UIColor *)color
{
	_color = color;

	self.currentColor = color;
}


- (void)setCurrentColor:(UIColor *)currentColor
{
	_currentColor = currentColor;

	[self setNeedsDisplay]; // Necessary to show the selection/highlighting of the button
}


- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIGraphicsPushContext(context);
	
	// Define the corners of the button
	CGSize  cornerRadii  = CGSizeMake(self.cornerRadius, self.cornerRadius);
	UIRectCorner cornerSettings = 0;
	switch (self.style) {
		case FMStepperButtonStyleLeftMinus:
			cornerSettings = UIRectCornerTopLeft | UIRectCornerBottomLeft;
			break;
		case FMStepperButtonStyleRightPlus:
			cornerSettings = UIRectCornerTopRight | UIRectCornerBottomRight;
			break;
		default:
			NSLog(@"Unhandled case in switch of %@", NSStringFromSelector(_cmd));
			break;
	}
	
	// Draw the Bezier path of button
	UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect
															   byRoundingCorners:cornerSettings
																	 cornerRadii:cornerRadii];
	[self.currentColor setFill];
	[roundedRectanglePath fill];
	
	switch (self.style) {
		case FMStepperButtonStyleLeftMinus:
			[self drawMinusSymbol:rect];
			break;
		case FMStepperButtonStyleRightPlus:
			[self drawPlusSymbol:rect];
			break;
		default:
			NSLog(@"Unhandled case in switch of %@", NSStringFromSelector(_cmd));
			break;
	}
	
	UIGraphicsPopContext();
}


// This assumes that the button is square
- (void)drawMinusSymbol:(CGRect)rect
{
	// The Bezier Path of the '-' sign
	// For 100x100, we'd have CGRectMake(23, 44, 54, 12)
	CGFloat glyphHeight  = 0.12f * rect.size.height;
	CGFloat glyphWidth   = 0.50f * rect.size.width;
	CGFloat glyphOriginX = 0.50f * (rect.size.height - glyphWidth);
	CGFloat glyphOriginY = 0.50f * (rect.size.height - glyphHeight);
	CGRect  glyphFrame   = CGRectMake(glyphOriginX, glyphOriginY, glyphWidth, glyphHeight);

	UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:glyphFrame];
	[[UIColor whiteColor] setFill];
	[rectanglePath fill];
}


// This assumes that the button is square
- (void)drawPlusSymbol:(CGRect)rect
{
	// Bezier Path of '+' sign
	CGFloat initialX   = 0.55f  * rect.size.width;
	CGFloat initialY   = 0.45f  * rect.size.height;
	CGFloat innerFar   = 0.75f * rect.size.width;
	CGFloat innerNear  = 0.25f * rect.size.width;

	UIBezierPath *bezierPath = [UIBezierPath bezierPath];
	[bezierPath moveToPoint:    CGPointMake(initialX,  initialY)];
	[bezierPath addLineToPoint: CGPointMake(innerFar,  initialY)];
	[bezierPath addLineToPoint: CGPointMake(innerFar,  initialX)];
	[bezierPath addLineToPoint: CGPointMake(initialX,  initialX)];
	[bezierPath addLineToPoint: CGPointMake(initialX,  innerFar)];
	[bezierPath addLineToPoint: CGPointMake(initialY,  innerFar)];
	[bezierPath addLineToPoint: CGPointMake(initialY,  initialX)];
	[bezierPath addLineToPoint: CGPointMake(innerNear, initialX)];
	[bezierPath addLineToPoint: CGPointMake(innerNear, initialY)];
	[bezierPath addLineToPoint: CGPointMake(initialY,  initialY)];
	[bezierPath addLineToPoint: CGPointMake(initialY,  innerNear)];
	[bezierPath addLineToPoint: CGPointMake(initialX,  innerNear)];
	[bezierPath addLineToPoint: CGPointMake(initialX,  initialY)];
	[bezierPath closePath];

	[[UIColor whiteColor] setFill];
	[bezierPath fill];
}


#pragma mark - UIControl


- (void)setEnabled:(BOOL)enabled
{
	self.currentColor = (enabled) ? self.color : [self.color colorWithAlphaComponent:0.7];

	[super setEnabled:enabled];
}


- (void)setHighlighted:(BOOL)highlighted
{
	if (![self isEnabled]) {
		return;
	}
	
	self.currentColor = (highlighted) ? [self.color colorDarkenedByFactor:0.3] : self.color;

	[super setHighlighted:highlighted];
}


- (void)setSelected:(BOOL)selected
{
	if (![self isEnabled]) {
		return;
	}
	
	self.currentColor =  (selected) ? [self.color colorDarkenedByFactor:0.3] : self.color;

	[super setSelected:selected];
}


@end
