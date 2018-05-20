//
//  ViewController.m
//  滚动视图
//
//  Created by 郭丰锐 on 2018/1/16.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

#define SCROLLWIDTH 200
#define SCROLLHEIGHT 300
@interface ViewController ()<UIScrollViewDelegate>
- (IBAction)btnAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 100, SCROLLWIDTH, SCROLLHEIGHT)];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor orangeColor];
    UIImage* image = [UIImage imageNamed:@"hani.jpg"];
    //内容视图一定要大于scrollView
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;
    //scrollView显示的内容视图 作为子视图加入scrollView
    //设定滚动视图支持的滚动范围
    [scrollView setContentSize:image.size];
    //关闭界面反弹效果
    [scrollView setBounces:NO];
    //关闭滚动条
    [scrollView setShowsHorizontalScrollIndicator:YES];//横
    
    [scrollView setShowsVerticalScrollIndicator:NO];//纵
    //设置滚动条样式
    [scrollView setIndicatorStyle:(UIScrollViewIndicatorStyleWhite)];
    //设定默认显示位置
    [scrollView setContentOffset:CGPointMake(270, 180)];
    //设置翻页滚动
    scrollView.pagingEnabled = YES;
    //设置不支持滚动
    [scrollView setScrollEnabled:YES];
    scrollView.tag = 99;
    //处理缩放
    [scrollView setMaximumZoomScale:2];
    [scrollView setMinimumZoomScale:1];
    [scrollView addSubview:imageView];
    
    [self.view addSubview:scrollView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnAction:(id)sender {
    UIScrollView* scrollView = [self.view viewWithTag:99];
    [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
#pragma mark- ScrollViewDelegate协议
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%s",__func__);
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取当前视图内容的偏移量
    NSLog(@"%s",__func__);
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s",__func__);
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return scrollView.subviews[0];
}
@end
