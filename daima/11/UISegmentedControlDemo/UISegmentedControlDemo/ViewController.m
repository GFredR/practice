//
//  ViewController.m
//  UISegmentedControlDemo


#import "ViewController.h"
@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)selected:(id)sender{
    UISegmentedControl* control = (UISegmentedControl*)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            //
            break;
        case 1:
            //
            break;
        case 2:
            //
            break;
            
        default:
            break;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UISegmentedControl* mySegmentedControl = [[UISegmentedControl alloc]initWithItems:nil];
    mySegmentedControl.segmentedControlStyle = UISegmentedControlStyleBezeled;
    UIColor *myTint = [[ UIColor alloc]initWithRed:0.66 green:1.0 blue:0.77 alpha:1.0];
    mySegmentedControl.tintColor = myTint;
    mySegmentedControl.momentary = YES;
    
    [mySegmentedControl insertSegmentWithTitle:@"First" atIndex:0 animated:YES];
    [mySegmentedControl insertSegmentWithTitle:@"Second" atIndex:2 animated:YES];
    [mySegmentedControl insertSegmentWithImage:[UIImage imageNamed:@"pic"]  atIndex:3 animated:YES];
    
    //[mySegmentedControl removeSegmentAtIndex:0 animated:YES];//删除一个片段
    //[mySegmentedControl removeAllSegments];//删除所有片段
    
    [mySegmentedControl setTitle:@"ZERO" forSegmentAtIndex:0];//设置标题
    NSString* myTitle = [mySegmentedControl titleForSegmentAtIndex:1];//读取标题
    NSLog(@"myTitle:%@",myTitle);
    
    //[mySegmentedControl setImage:[UIImage imageNamed:@"pic"] forSegmentAtIndex:1];//设置
    UIImage* myImage = [mySegmentedControl imageForSegmentAtIndex:2];//读取
    
    [mySegmentedControl setWidth:100 forSegmentAtIndex:0];//设置Item的宽度
    
    [mySegmentedControl addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];
    
    //[self.view addSubview:mySegmentedControl];//添加到父视图
    
    self.navigationItem.titleView = mySegmentedControl;//添加到导航栏
    
    //可能显示出来乱七八糟的，不过没关系，我们这是联系它的每个功能，所以你可以自己练练,越乱越好，关键在于掌握原理。
    // 你可以尝试修改一下 让他显示的美观
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
