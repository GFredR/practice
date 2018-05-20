//
//  HNButton.h
//


typedef NS_ENUM (NSUInteger, HNButtonDesignState){
    HNButton_OnlyTextWithColor,     //An Icon
    HNButton_TextColourImage,       //An Icon
    HNButton_TextandImage,          //An Icon
    HNButton_OnlyText,
    HNButton_OnlyImage,
    HNButton_OnlyBgImage,
    HNButton_TextandBgImage,
    HNButton_TheWholeEnchilada,     //Icon, background, text; this button is living the dream.
};
typedef void (^HNCompletionHandler)(BOOL success);

#import "HNButton.h"
#define hRevertTime 2
#define hNilBackground      [UIColor clearColor]
#define hDisabledBackground [UIColor grayColor]

@interface HNButton()
{
    BOOL backGroundImage;
    
    NSString * buttonText;
    UIColor  * buttonColor;
    UIImage  * buttonImage;
    UIImage  * buttonBgImage;
    HNCompletionHandler _completionHandler;
}

-(IBAction)buttonWasClicked:(id)sender;

@property (nonatomic, assign) BOOL iconVisibilty;
@property (nonatomic, assign) BOOL endStateSelected;
@property (nonatomic, assign) BOOL indicatorSet;
@property (nonatomic, assign) BOOL initialSaved;
@property (nonatomic, assign) BOOL textVisibilty;

@property (strong, nonatomic) UIColor * hnIndyColor;
@property (strong, nonatomic) UIActivityIndicatorView * hnIndyView;
@property (nonatomic, assign) UIActivityIndicatorViewStyle hnIndyStyle;

@property (strong, nonatomic)  UIImage *successButtonImage;
@property (strong, nonatomic)  UIImage *failureButtonImage;

@end

@implementation HNButton

#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self )
    {
        [self addIndicator];
        
        //  Save details for restore state
        [self saveCurrent];
        
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit
{
    [self removeTarget:self action:@selector(buttonWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget   :self action:@selector(buttonWasClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Required : Start State

-(void)addIndicator
{
    [self createIndicatorView];
}

- (void)setIndicatorColor:(UIColor*)indicatorViewColor
{
    _hnIndyColor = indicatorViewColor;
    [_hnIndyView setColor:_hnIndyColor];
}

- (void)setIndicatorStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle withColor:(UIColor*)indicatorViewColor
{
    [self setIndicatorColor:indicatorViewColor];
    [self setIndicatorStyle:activityIndicatorViewStyle];
    [_hnIndyView setActivityIndicatorViewStyle:activityIndicatorViewStyle];
}

#pragma mark - Required : End State

-(void)finishLoading
{
    if(![self.hnIndyView isAnimating]) return;
    
    [self.hnIndyView stopAnimating];
    
    self.enabled = YES;
    
    [self revertToOriginalState];
}

-(void)finishLoading:(BOOL)loadingStatus
{
    if(![self.hnIndyView isAnimating]) return;
    
    [self.hnIndyView stopAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval: self.hnTransitionTimeInterval
                                     target: self
                                   selector: @selector(revertToOriginalState)
                                   userInfo: nil
                                    repeats: NO];
    self.enabled = YES;

    [self setUserInteractionEnabled:NO]; //Corresponding in saveCurrent

    [self setFinishedState:loadingStatus];
}

-(void)finishLoading:(BOOL)loadingStatus withCompletionHandler:(void (^)(BOOL))completion
{
    if(![self.hnIndyView isAnimating]) return;
    
    [self.hnIndyView stopAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval: self.hnTransitionTimeInterval
                                     target: self
                                   selector: @selector(revertToOriginalState)
                                   userInfo: nil
                                    repeats: NO];
    
    self.enabled = YES;
    [self setFinishedState:loadingStatus];
    _completionHandler = [completion copy];
}

- (void)setSelectedOnCompletion
{
    _endStateSelected = YES;
}


-(void)enableButtonIndicator
{
    [self setButtonIndicator:YES];
}

-(void)disableButtonIndicator
{
    [self setButtonIndicator:NO];
}

#pragma mark - Optional : Customize Transition State


- (void)setSuccessImage:(UIImage*)successImage showingText:(BOOL)textVisibilityStatus andShowingIcon:(BOOL)iconVisibilityStatus
{
    [self setSuccessImage:successImage showingText:textVisibilityStatus];
    _iconVisibilty = iconVisibilityStatus;
}

- (void)setFailureImage:(UIImage*)failureImage showingText:(BOOL)textVisibilityStatus andShowingIcon:(BOOL)iconVisibilityStatus
{
    _iconVisibilty = iconVisibilityStatus;
    [self setFailureImage:failureImage showingText:textVisibilityStatus];
}


- (void)setSuccessImage:(UIImage*)successImage showingText:(BOOL)textVisibilityStatus
{
    _textVisibilty = textVisibilityStatus;
    _successButtonImage = successImage;

}
- (void)setFailureImage:(UIImage*)failureImage showingText:(BOOL)textVisibilityStatus
{
    _textVisibilty = textVisibilityStatus;
    _failureButtonImage = failureImage;
}



#pragma mark - Private methods

-(void)setButtonIndicator:(BOOL)status
{
    if(_hnIndyView)
        _indicatorSet = status;
}


-(void)createIndicatorView
{
    if(_indicatorSet)   return;
    
    _indicatorSet = YES;
    [self addSubview:self.hnIndyView];
}

-(IBAction)buttonWasClicked:(id)sender
{
    if(!_initialSaved) {[self saveCurrent]; [self addIndicator];}
    
    if(!_indicatorSet) return;
    
    [self.hnIndyView startAnimating];

    //  Disable till function is completed
    self.enabled = NO;
    
    if(([self designQuery]|HNButton_TextColourImage)==1)
    {
        const double* rgbOfColor = CGColorGetComponents(buttonColor.CGColor);
        [self setBackgroundColor:[UIColor colorWithRed:rgbOfColor[0] green:rgbOfColor[1] blue:rgbOfColor[2] alpha:0.5]];
    }
    else if([self designQuery] > HNButton_OnlyText){
        //Grey the image in next ver. Maybe.
    }

    [self setNeedsDisplay];
}

-(void)saveCurrent
{
    backGroundImage = !(self.currentBackgroundImage == nil);
    
    buttonColor   = self.backgroundColor;
    
    buttonText    = [self titleForState:[self state]];
    
    buttonImage   = [self imageForState:[self state]];
    
    buttonBgImage = [self backgroundImageForState:[self state]];
    
    _initialSaved = YES;
    
    [self setUserInteractionEnabled:YES]; //Disabled during transition state, enabled here.
}


-(void)revertToOriginalState
{
    if(!_indicatorSet) return;

    
    [self setBackgroundColor: buttonColor];
    [self setTitle:buttonText forState:[self state]];
    
    [self setImage:buttonImage forState:self.state];
    [self setBackgroundImage:buttonBgImage forState:self.state];
    
    [self setNeedsDisplay];
    
    if((_endStateSelected)&&([self state] != UIControlStateSelected))
    {
        [self setSelectionStatus];
    }
    else
    {
        [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(saveCurrent)
                                   userInfo: nil
                                    repeats: NO];
    }
    
    if(_completionHandler)
    {
        _completionHandler(YES);
        _completionHandler = nil;
    }
    
    
}

-(void)setSelectionStatus
{
    [self setSelected:YES];
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(saveCurrent)
                                   userInfo: nil
                                    repeats: NO];
}



-(void)setFinishedState:(BOOL)state
{
    if(!_indicatorSet) return;
    
    if (((state) && (self.imageForSuccess))||((!state) && (self.imageForFailure)))
    {
        UIImage * transitionalImage = (state) ? self.imageForSuccess : self.imageForFailure;

            if (([self designQuery] != HNButton_TextandImage)&&(!_iconVisibilty))
            {
                [self setImage:nil forState:self.state];
            }
            [self setBackgroundImage:transitionalImage forState:self.state];
        
            if(_textVisibilty)
            {
                [self setTextForButtonState:state];
            }
            else
                [self setTitle:@"" forState:[self state]];

            [self setBackgroundColor:hNilBackground];
    }
    else
    {
        [self setTextForButtonState:state];
        [self setBackgroundColor:buttonColor];
    }
    
    [self setNeedsDisplay];
}

-(void)setTextForButtonState:(BOOL)state
{
    NSString * string = (state) ? self.successText : self.failureText;
    [self setTitle:string forState:[self state]];
}

-(void)setIndicatorStyle:(UIActivityIndicatorViewStyle)indyStyle
{
    _hnIndyStyle = ++ indyStyle;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if(selected && _endStateSelected)
    {
//        [self removeIndy];
        [self disableButtonIndicator];
    }
    else
    {
        [self enableButtonIndicator];
//        [self addIndicator];
//        [self commonInit];
    }
}

#pragma mark -

-(void)removeIndy
{
    _indicatorSet = NO;
    _initialSaved = NO;
    
    _hnIndyView = nil;
    
    buttonImage = buttonBgImage = nil;
    
    buttonText = nil;
    
    [_hnIndyView removeFromSuperview];
    
    [self removeTarget:self action:@selector(buttonWasClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(NSString*)paddedString:(NSString*)mainString
{
    NSUInteger stringLength = buttonText ? ceil(buttonText.length/2) : 2;
    mainString = [mainString stringByPaddingToLength:stringLength withString:@" " startingAtIndex:0];
    mainString = [NSString stringWithFormat:@"%@%@", [mainString substringFromIndex:1], mainString];
    return mainString;
}

-(HNButtonDesignState) designQuery
{
    if(buttonImage)
    {
        if(buttonText)
        {
            if(buttonBgImage)
                return HNButton_TheWholeEnchilada;
            else
                {
                    if(buttonColor)
                        return HNButton_TextColourImage;
                    else
                        return HNButton_TextandImage;
                }
        }
        else
        {
            if(buttonBgImage)
                return HNButton_TheWholeEnchilada;
            else
                return HNButton_OnlyImage;
        }
    }
    else if(buttonBgImage)
    {
        if (buttonText)
            return HNButton_TextandBgImage;
        else
            return HNButton_OnlyBgImage;
    }
    else
    {
        if(buttonColor)
            return HNButton_OnlyTextWithColor;
        else
            return HNButton_OnlyText;
    }
}


#pragma mark -


-(UIActivityIndicatorView*)hnIndyView
{
    if(!_hnIndyView)
    {
        self.hnIndyView = [[UIActivityIndicatorView alloc] initWithFrame:self.frame];
        [self.hnIndyView setActivityIndicatorViewStyle:self.hnIndyStyle];
        [self.hnIndyView setColor:self.hnIndyColor];
        [self.hnIndyView setCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))];
        [self.hnIndyView setHidesWhenStopped:YES];
    }
    return _hnIndyView;
}

-(UIImage*)imageForSuccess{
    return (_successButtonImage ?: nil);
}

-(UIImage*)imageForFailure{
    return (_failureButtonImage ?: nil);
}

-(UIActivityIndicatorViewStyle)hnIndyStyle{
    return (_hnIndyStyle ? (_hnIndyStyle-1) : UIActivityIndicatorViewStyleGray);
}

-(NSTimeInterval)hnTransitionTimeInterval{
    return (_hnTransitionTimeInterval ?: hRevertTime);
}

-(NSString*)successText{
    return (_successText ?: [self paddedString:@"✓"]);
}

-(NSString*)failureText{
    return (_failureText ?: [self paddedString:@"⚠"]);
}

-(UIColor*)hnIndyColor{
    return (_hnIndyColor ?: [UIColor grayColor]);
}

@end
