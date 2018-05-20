

#import "ViewController.h"
#import "UILabelEx.h"
@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

#if 0
	UILabel* label = [[UILabel alloc] initWithFrame:self.view.bounds];
    
    label.text = @"This is a UILabel Demo,";
    label.font = [UIFont fontWithName:@"Arial" size:35];
    label.textColor = [UIColor yellowColor];
   label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor blueColor];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:self.view.bounds.size lineBreakMode:label.lineBreakMode];
    
    CGRect rect = label.frame;
    rect.size.height = size.height;
    label.frame = rect;
    
#endif
    
#if 1
	UILabelEx* label = [[UILabelEx alloc] initWithFrame:self.view.bounds];
    
    label.text = @"This is a UILabel Demo,";
    label.font = [UIFont fontWithName:@"Arial" size:35];
    label.textColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blueColor];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.verticalAlignment = VerticalAlignmentTop;
    
#endif
    
    [self.view addSubview:label];
    [label release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
