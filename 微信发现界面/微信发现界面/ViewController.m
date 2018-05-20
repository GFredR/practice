//
//  ViewController.m
//  微信发现界面
//
//  Created by 郭丰锐 on 2018/2/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "MyModel.h"
#import "ReactiveObjC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)NSArray* dataSource;
@end

@implementation ViewController

-(NSArray *)dataSource{
    if (_dataSource == nil) {
        NSArray* dataArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"dataList" ofType:@"plist"]];
        
        NSMutableArray* muArr = [NSMutableArray new];
        for (NSInteger i = 0; i<dataArray.count; i++) {
            NSMutableArray* muSectionArr = [NSMutableArray new];
            NSArray* sectionArray = dataArray[i];
            
            for (NSInteger j = 0; j<sectionArray.count; j++) {
                NSDictionary* modelDic = sectionArray[j];
                MyModel* model = [[MyModel alloc] init];
                model.tittle = modelDic[@"tittle"];
                model.image = modelDic[@"image"];
                
                [muSectionArr addObject:model];
                
            }
            [muArr addObject:muSectionArr];
        }
        
        _dataSource = muArr;
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"weixinCell"];
    
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"weixinCell" forIndexPath:indexPath];
    
    NSArray *sectionArray = self.dataSource [indexPath.section];
    MyModel* model = sectionArray [indexPath.row];
    UIImage *image = [UIImage imageNamed:model.image] ;
    NSString *tittleString = model.tittle;
    
    tableViewCell.textLabel.text = tittleString;
    tableViewCell.imageView.image = image;
    
    [tableViewCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return tableViewCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *sectionArray = self.dataSource [indexPath.section];
    MyModel *modle = sectionArray [indexPath.row];
    
    NSString *detailString = modle.tittle;
    
    //rac
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    
    detailVC.lastTittle = detailString;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
