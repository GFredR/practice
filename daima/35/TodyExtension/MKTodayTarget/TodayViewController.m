//
//  TodayViewController.m


#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

NSString *CellId = @"cellId";

#define GROUP_ID (@"group.MKTodyExtension")
#define TODO_LIST_ID (@"todoListID")

@interface TodayViewController () <NCWidgetProviding, UITableViewDelegate, UITableViewDataSource>

@end

@implementation TodayViewController
{
    NSArray<NSString *> *todoList;
    
    __weak IBOutlet UITableView *contentTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [contentTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - NCWidgetProviding
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    [self loadContents];
    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsMake(0, 27, 0, 0);
}

- (void)loadContents{
    NSUserDefaults *infoDic = [[NSUserDefaults alloc] initWithSuiteName: GROUP_ID];
    todoList = [infoDic objectForKey: TODO_LIST_ID];
    
    if(todoList.count >= 4){
        todoList = [todoList subarrayWithRange:NSMakeRange(todoList.count-4, 4)];
    }
    
    if(todoList.count == 0){
        todoList = @[@"添加ToDo"];
    }
    
    [contentTableView reloadData];
    self.preferredContentSize = CGSizeMake(0, todoList.count * 44-1);
}


#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    cell.textLabel.text = todoList[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *text = todoList[indexPath.row];
    if([text isEqualToString:@"添加ToDo"]){
        text = @"new_item";
    }else{
        NSUserDefaults *infoDic = [[NSUserDefaults alloc] initWithSuiteName: GROUP_ID];
        NSArray *array = [infoDic objectForKey: TODO_LIST_ID];
        
        text = [NSString stringWithFormat:@"%@", @([array indexOfObject:text])];
    }
    
    NSString *urlStr = [@"MKToday://" stringByAppendingString: text];
    
    //打开主应用
    [self.extensionContext openURL:[NSURL URLWithString:urlStr] completionHandler:nil];
}

@end
