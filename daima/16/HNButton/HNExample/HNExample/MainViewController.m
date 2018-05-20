//
//  MainViewController.m
//  HNExample
//


#import "MainViewController.h"
@interface MainViewController ()
@end

@implementation MainViewController


-(void)addButtons
{
    
    codedButton = [HNButton buttonWithType:UIButtonTypeContactAdd];
    [codedButton setTitle:@"Title" forState:UIControlStateNormal];
    [codedButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    codedButton2 = [HNButton buttonWithType:UIButtonTypeInfoLight];
    [codedButton2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [codedButton setFrame:CGRectMake(0, 40, CGRectGetMidX(self.view.frame), 40)];
    [codedButton2 setFrame:CGRectOffset(codedButton.frame, 160, 0)];
    
    [self.view addSubview:codedButton];
    [self.view addSubview:codedButton2];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addButtons];
    
    UIImage * tsOne   = [UIImage imageNamed:@"TS_1.png"];
    UIImage * tsThree = [UIImage imageNamed:@"TS_3.png"];
    UIImage * tsFour  = [UIImage imageNamed:@"TS_4.png"];
    UIImage * done    = [UIImage imageNamed:@"successImage.png"];
    
    
    //0
//    [codedButton2 setSelectedOnCompletion];
    
    //1
    [_bgColour setSuccessImage:tsOne showingText:YES];
    
    
    //2
    [_bgImage setIndicatorColor:[UIColor redColor]];
    [_bgImage setSuccessImage:done showingText:NO];
    //Increase the duration of transition state
    [_bgImage setHnTransitionTimeInterval:5];
    
    
    //3
    [_bgColourIcon setIndicatorColor:[UIColor whiteColor]];
    //Customize the disabled state to influence the loading state
    [_bgColourIcon setTitle:@"Loading State" forState:UIControlStateDisabled];
    
    //4
    [_bgImageIcon setIndicatorColor:[UIColor purpleColor]];
    [_bgImageIcon setSuccessImage:tsFour showingText:YES andShowingIcon:NO];
    [_bgImageIcon setSuccessText:@"Transition: Success"];
    //Final state is Selected
    [_bgImageIcon setSelectedOnCompletion];
    [_bgImageIcon setTitle:@"Selected State" forState:UIControlStateSelected];
    [_bgImageIcon setTitle:@"" forState:UIControlStateHighlighted|UIControlStateSelected];

    
    //5
    [_withHandler setIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge withColor:[UIColor purpleColor]];
    [_withHandler setFailureImage:tsThree showingText:YES andShowingIcon:YES];
    [_withHandler setFailureText:@"Transition: Failure"];
}


#pragma mark -

- (IBAction)buttonAction:(id)sender
{
    NSURL *url = [NSURL URLWithString:[@"http://www.google.com/flights" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest
                                       requestWithURL:url
                                       cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    
    [theRequest setHTTPMethod:@"GET"];

    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data ,NSError *error) {

            BOOL endSuccessStatus = (!error) ? YES : NO ;
        
            //Normally you'd be using the endSuccessStatus, but to show the cases we've hard-coded the final states.

            if (sender == codedButton2)
            {
                //Skips transition state and reverts to original
                [sender finishLoading];
            }
            else if (sender == _bgColour)
            {
                [sender finishLoading:!endSuccessStatus];
            }
            else if (sender == _withHandler)
            {
                [sender finishLoading:NO  withCompletionHandler:^(BOOL success){
                    NSString * alertMessage = @"Completion handler";
                    UIAlertView * alertWindow = [[UIAlertView alloc] initWithTitle:@"" message:alertMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [alertWindow show];
                    
                    [_bgImageIcon setSelected:NO];

                    
                    //Disables the indicator till you call enableButtonIndicator
                    [sender disableButtonIndicator];
                }];
            }
            else
            {
                [sender finishLoading:endSuccessStatus];
            }
    }];
}
@end
