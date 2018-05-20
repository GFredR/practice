//
//  TableViewController.m
//  TableView基本设置1
//
//  Created by 郭丰锐 on 2018/1/25.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property(strong, nonatomic)NSArray* dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* arr = @[@"漩涡鸣人",@"宇智波佐助",@"宇智波泉奈",@"宇智波止水",@"漩涡鸣人",@"宇智波佐助",@"宇智波泉奈",@"宇智波止水",@"漩涡鸣人",@"宇智波佐助",@"宇智波泉奈",@"宇智波止水",@"漩涡鸣人",@"宇智波佐助",@"宇智波泉奈",@"宇智波止水"];
    self.dataSource = [NSArray arrayWithArray:arr];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"renzhe"];
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"renzhe"];
    //[self.view setBackgroundColor:[UIColor redColor]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//表格里面有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
//必须实现，每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}
//必须实现,每一行的数据以什么方式展示
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"renzhe" forIndexPath:indexPath];
    
    
    //旧办法
    //先查找是否存在一个可以拿来复用的cell对象
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"renzhe"];
//    if (cell == nil) {
//        UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"renzhe"];
//    }
    //寻找可复用的cell,如果没有自动创建
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"renzhe" forIndexPath:indexPath];
    NSLog(@"cell:%p",cell);
    cell.textLabel.text = self.dataSource[indexPath.row];
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
