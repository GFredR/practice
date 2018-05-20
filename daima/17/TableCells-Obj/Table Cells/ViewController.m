//
//  ViewController.m

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSArray *computers;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.computers = @[@{@"Name" : @"AA", @"Color" : @"红色"},
                       @{@"Name" : @"BB", @"Color" : @"红色"},
                       @{@"Name" : @"CC", @"Color" : @"红色"},
                       @{@"Name" : @"DD", @"Color" : @"红色"},
                       @{@"Name" : @"EE", @"Color" : @"红色"}];
    
    [self.tableView registerClass:[NameAndColorCell class]
                     forCellReuseIdentifier:CellTableIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NameAndColorCell *cell =
           [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier
                      forIndexPath:indexPath];
    
    NSDictionary *rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return cell;
}

@end
