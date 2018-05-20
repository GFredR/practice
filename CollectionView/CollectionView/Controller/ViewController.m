//
//  ViewController.m
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "TableViewCell.h"
#import "WebViewController.h"

#import "DataService.h"
#define IDENT @"cCell"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)UICollectionView* collectionView;
@property(strong, nonatomic)NSMutableArray* dataSources;
@property(strong, nonatomic)UITableView* tableView;
@property(strong, nonatomic)NSDictionary* dic;
@end

@implementation ViewController


- (NSMutableArray *)dataSources{
    if (_dataSources == nil) {
        _dataSources = [NSMutableArray array];

        
        NSArray* dataArr = [DataService dataSource];
        
        for (_dic in dataArr) {
            Model* modelData = [[Model alloc]init];
            modelData.title = [_dic objectForKey:@"title"];
            modelData.modelImage = [_dic objectForKey:@"image"];
            modelData.modelDetail = [_dic objectForKey:@"summary"];
//           modelD
//            modelData setValueForKey
            [_dataSources addObject:modelData];
            
            
        }
    }
    return _dataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    [self createTableView];
    
    [self setNav];
    

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)setNav{
    UILabel* title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    title.text = @"新闻";
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = title;
}

- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    UINib* nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];

    [_tableView registerNib:nib forCellReuseIdentifier:IDENT];
    _tableView.rowHeight = 100;
//    [_tableView setBackgroundColor:[UIColor blackColor]];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"%ld",self.dataSource.count);
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:IDENT forIndexPath:indexPath];
    Model* del = [self.dataSources objectAtIndex:indexPath.row];
//    NSLog(@"%ld",self.dataSource.count);
    UIImageView* imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selectImage"]];
    [cell setSelectedBackgroundView:imgV];
    cell.model = del;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   

    WebViewController* wvc = [[WebViewController alloc]init];
    [self.navigationController pushViewController:wvc animated:YES];
}

//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cusCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor orangeColor];
//    return cell;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
