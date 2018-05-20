//
//  ViewController.m
//  TableViewCell外观
//
//  Created by 郭丰锐 on 2018/1/30.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)NSArray* dataSource;
@end

@implementation ViewController

- (NSArray*)dataSource{
    if (_dataSource == nil) {
        NSArray* arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dataList" ofType:@"plist"]];
        _dataSource = arr;
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    
    UILabel* tittleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    [tittleLabel setBackgroundColor:[UIColor orangeColor]];
    tittleLabel.text = @"tittle";
    
    [tableView setTableHeaderView:tittleLabel];
    
    UIView* footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    [footView setBackgroundColor:[UIColor cyanColor]];
    [tableView setTableFooterView:footView];
    [self.view addSubview:tableView];
  
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"32_1.jpg"];
    //设置挂件
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    //设置挂件视图
    UISwitch* s = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [cell setAccessoryView:s];
    //设置风格
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    //[cell setSelected:YES];
    UIView* selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [selectedView setBackgroundColor:[UIColor blueColor]];
    [cell setSelectedBackgroundView:selectedView];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
#pragma mark 设置分区头和尾
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor yellowColor]];
    label.text = @"分区头";
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}





















@end
