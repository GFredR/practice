//
//  DateChooserViewController.m


#import "DateChooserViewController.h"

@implementation DateChooserViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



-(void)viewDidAppear:(BOOL)animated {
    [(ViewController *)self.delegate calculateDateDifference:[NSDate date]];
}

-(void)viewWillDisappear:(BOOL)animated {
    ((ViewController *)self.delegate).dateChooserVisible=NO;
}

- (void)viewDidUnload
{
    [self setDelegate:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)dismissDateChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setDateTime:(id)sender {
    [(ViewController *)delegate calculateDateDifference:((UIDatePicker *)sender).date];
}

@end
