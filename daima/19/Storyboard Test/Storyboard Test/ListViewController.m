//
//  ListViewController.m
//  Storyboard Test


#import "ListViewController.h"

@interface ListViewController ()
@property (strong, nonatomic) NSMutableArray *listArray;
@property (copy, nonatomic) NSDictionary *editedSelection;
@end

@implementation ListViewController

@synthesize listArray;
@synthesize editedSelection;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.listArray == nil) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
                                 @"Horse", @"Sheep", @"Pig", @"Dog",
                                 @"Cat", @"Chicken", @"Duck", @"Goose",
                                 @"Tree", @"Flower", @"Grass", @"Fence",
                                 @"House", @"Table", @"Chair", @"Book",
                                 @"Swing" ,nil];
        self.listArray = array;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)setEditedSelection:(NSDictionary *)dict {
    if (![dict isEqual:editedSelection]) {
        editedSelection = dict;
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        id newValue = [dict objectForKey:@"object"];
        [listArray replaceObjectAtIndex:indexPath.row withObject:newValue];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
    }
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *identifier = nil;
    if (row%2 == 0) {
        identifier = @"GreenIdentifier";
    }else 
        identifier = @"RedIdentifier";
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1];
    cellLabel.text = [listArray objectAtIndex:row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //获取目的ViewController
    UIViewController *destination = [segue destinationViewController];
    if ([destination respondsToSelector:@selector(setPreViewController:)]) {
        //将自身传递给目的ViewController
        [destination setValue:self forKey:@"preViewController"]; 
    } 
    if ([destination respondsToSelector:@selector(setSelection:)]) { 
        //目的ViewController中的selection属性存储的就是需要编辑的内容及其在表格中的位置 
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender]; 
        id object = [self.listArray objectAtIndex:indexPath.row]; 
        NSDictionary *selection = [NSDictionary dictionaryWithObjectsAndKeys:
                                   indexPath, @"indexPath", 
                                   object, @"object", 
                                   nil]; 
        [destination setValue:selection forKey:@"selection"]; 
    } 
    
}

@end
