//
//  ViewController.m
//  UIAlertController
//


#import "ViewController.h"
#import "AlertVC.h"
#import "ActionVC.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>



@property (nonatomic, strong) UIAlertController *alertController;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self.view addSubview:self.tableView];

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    if (indexPath.row == 0)     cell.textLabel.text = @" 使用UIAlertController 实现 UIAlertView 效果";
    if (indexPath.row == 1)     cell.textLabel.text = @" 使用UIAlertController 实现 UIActionSheet 效果";
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        AlertVC *alertVC = [[AlertVC alloc] init];
        [self.navigationController pushViewController:alertVC animated:YES];

    }
    if (indexPath.row == 1)
    {
        ActionVC *actionVC = [[ActionVC alloc] init];
        [self.navigationController pushViewController:actionVC animated:YES];
    }
}

#pragma mark - lazy load

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (UIAlertController *)alertController
{
    if (!_alertController)
    {
        _alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    }
    return _alertController;
}


















@end
