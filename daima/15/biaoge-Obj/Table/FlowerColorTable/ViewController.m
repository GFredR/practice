

#import "ViewController.h"

#define kSectionCount 2
#define kRedSection 0
#define kBlueSection 1

@implementation ViewController

@synthesize redFlowers;
@synthesize blueFlowers;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.redFlowers = [[NSArray alloc]
                       initWithObjects:@"aa",@"bb",@"cc",
                       @"dd",nil];
	self.blueFlowers = [[NSArray alloc]
                        initWithObjects:@"ee",@"ff",
                        @"gg",@"hh",@"ii",nil];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setRedFlowers:nil];
    [self setBlueFlowers:nil];
    [super viewDidUnload];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView 
    numberOfRowsInSection:(NSInteger)section
{
	switch (section) {
		case kRedSection:
			return [self.redFlowers count];
		case kBlueSection:
			return [self.blueFlowers count];
		default:
			return 0;
	}
}

- (NSString *)tableView:(UITableView *)tableView 
titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case kRedSection:
            return @"红";
        case kBlueSection:
            return @"蓝";
        default:
            return @"Unknown";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"flowerCell"];
    
    
    switch (indexPath.section) {
		case kRedSection:
			cell.textLabel.text=[self.redFlowers 
                                 objectAtIndex:indexPath.row];
			break;
		case kBlueSection:
			cell.textLabel.text=[self.blueFlowers 
                                 objectAtIndex:indexPath.row];
			break;
		default:
			cell.textLabel.text=@"Unknown";
	}
    
    UIImage *flowerImage;
    flowerImage=[UIImage imageNamed:
                 [NSString stringWithFormat:@"%@%@",
                  cell.textLabel.text,@".png"]];
    cell.imageView.image=flowerImage;
    
    return cell;
}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView 
            didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UIAlertView *showSelection;
	NSString	*flowerMessage;
    
	switch (indexPath.section) {
		case kRedSection:
			flowerMessage=[[NSString alloc] 
						   initWithFormat:
						   @"你选择了红色 - %@",
						   [self.redFlowers objectAtIndex: indexPath.row]];
			break;
		case kBlueSection:
			flowerMessage=[[NSString alloc] 
						   initWithFormat:
						   @"你选择了蓝色 - %@",
						   [self.blueFlowers objectAtIndex: indexPath.row]];
			break;
		default:
			flowerMessage=[[NSString alloc] 
						   initWithFormat:
						   @"我不知道选什么!?"];
			break;
	}
	
	showSelection = [[UIAlertView alloc] 
					 initWithTitle: @"已经选择了" 
					 message:flowerMessage 
					 delegate: nil 
					 cancelButtonTitle: @"Ok" 
					 otherButtonTitles: nil];
	[showSelection show];
}


@end
