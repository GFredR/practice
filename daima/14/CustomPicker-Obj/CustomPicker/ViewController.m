//
//  ViewController.m
//  CustomPicker


#import "ViewController.h"

@implementation ViewController

@synthesize outputLabel;
@synthesize animalChooserVisible;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)displayAnimal:(NSString *)chosenAnimal withSound:(NSString *)chosenSound fromComponent:(NSString *)chosenComponent {
    
    NSString *animalSoundString;
    animalSoundString=[[NSString alloc]
                       initWithFormat:@"你改变 %@ (%@ 和声音文字 %@)",
                       chosenComponent,chosenAnimal,chosenSound];
    self.outputLabel.text=animalSoundString;
    
    
}

- (IBAction)showAnimalChooser:(id)sender {
    if (self.animalChooserVisible!=YES) {
        [self performSegueWithIdentifier:@"toAnimalChooser" sender:sender];
        self.animalChooserVisible=YES;
    }
}


#pragma mark - View lifecycle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((AnimalChooserViewController *)segue.destinationViewController).delegate=self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutputLabel:nil];
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
