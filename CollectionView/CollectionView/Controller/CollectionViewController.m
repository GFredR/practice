//
//  CollectionViewController.m
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "CollectionViewController.h"
#import "DataService.h"
#import "ImgModel.h"
#import "CollectionViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(strong, nonatomic)NSMutableArray* dataSource;
@end

@implementation CollectionViewController
static NSString * const reuseIdentifier = @"Cell";
- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
        NSArray* dataArr = [DataService imgSource];
        
        for (NSDictionary* dic in dataArr) {
            ImgModel* modelData = [[ImgModel alloc]init];
            
            modelData.imgURL = [dic objectForKey:@"image"];
            
            [_dataSource addObject:modelData];
//            NSLog(@"%@",_dataSource);
        }
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataSource];
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake((WIDTH-40)/3, 150);
    
    UICollectionView* collect = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    collect.delegate = self;
    collect.dataSource = self;
    [collect registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.view addSubview:collect];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //    [self.ite setBackgroundColor:[UIColor orangeColor]];
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor orangeColor]];
    // Configure the cell
    //    cell = [_dataSource objectAtIndex:indexPath.item];
    ImgModel* model = [[ImgModel alloc]init];
    model = [self.dataSource objectAtIndex:indexPath.item];
    NSLog(@"%@",self.dataSource);
    cell.imgMod = model;
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
