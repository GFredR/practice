//
//  HNButton.h


#import <UIKit/UIKit.h>

@interface HNButton : UIButton

#pragma mark - Properties


/**
 *  Customize transition state
**/

@property (assign, nonatomic)  NSString * successText;
@property (assign, nonatomic)  NSString * failureText;
@property (assign, nonatomic)  NSTimeInterval hnTransitionTimeInterval;


#pragma mark - Required : End State
// Necessary to complete the loading process

/**
 *  Reverts the button to original state
**/
- (void)finishLoading;


/**
 *  Reverts the button to original state after a transitional state
 *  where button reflects the loading status
 *
 *  @param loadingStatus outcome of the loading state.
**/
- (void)finishLoading:(BOOL)loadingStatus;


/**
 *  Reverts the button to original state after a transitional state
 *  where button reflects the loading status and comes with completion block
 *
 *  @param loadingStatus outcome of the loading state.
 *  @param completion    completion block for after the transition and revert state
 *
 *  Mighty presumptious about the block's usefulness
 *                              ...but a little forethought never bothered me anyway.
**/
- (void)finishLoading:(BOOL)loadingStatus withCompletionHandler:(void (^)(BOOL done))completion;


/**
 *  Optional Control
**/

/**
 *  Call if button should move to selected state after loading (/+transition)
 *  To reuse the indicator, deselect the button
 */
- (void)setSelectedOnCompletion;


/**
 *  Disable Indicator for future clicks
 */
-(void)disableButtonIndicator;


/**
 *  Enable Indicator for future clicks
 */
-(void)enableButtonIndicator;


#pragma mark - Optional : Customize Indicator View


/**
 *  Set choice colour.
 *
 *  @param indicatorViewColor UIColour for UIActivityIndicatorView
 **/
- (void)setIndicatorColor:(UIColor*)indicatorViewColor;


/**
 *  Set choice colour and style.
 *
 *  @param activityIndicatorViewStyle   style of UIActivityIndicatorView
 *  @param indicatorViewColor           UIColour for UIActivityIndicatorView
 **/
- (void)setIndicatorStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle withColor:(UIColor*)indicatorViewColor;


#pragma mark - Optional : Customize Transition State


/**
 *  Set a  success image that flashes when YES is passed in finishLoading:
 *
 *  @param successImage         Name of the success UIImage
 *  @param textVisibilityStatus ? Only show image : Show text
**/
- (void)setSuccessImage:(UIImage*)successImage showingText:(BOOL)textVisibilityStatus;


/**
 *  Set a  failureImage image that flashes when NO is passed in finishLoading:
 *
 *  @param failureImage         Name of the failure UIImage
 *  @param textVisibilityStatus ? Only show image : Show text
**/
- (void)setFailureImage:(UIImage*)failureImage showingText:(BOOL)textVisibilityStatus;


/**
 *  Set a  success image that flashes when YES is passed in finishLoading:
 *
 *  @param successImage         Name of the success UIImage
 *  @param textVisibilityStatus ? Only show image   : Show text
 *  @param iconVisibilityStatus ? Show icon         : Hide icon
**/
- (void)setSuccessImage:(UIImage*)successImage showingText:(BOOL)textVisibilityStatus andShowingIcon:(BOOL)iconVisibilityStatus;


/**
 *  Set a  failure image that flashes when YES is passed in finishLoading:
 *
 *  @param failureImage         Name of the failure UIImage
 *  @param textVisibilityStatus ? Only show image   : Show text
 *  @param iconVisibilityStatus ? Show icon         : Hide icon
**/
- (void)setFailureImage:(UIImage*)failureImage showingText:(BOOL)textVisibilityStatus andShowingIcon:(BOOL)iconVisibilityStatus;


@end