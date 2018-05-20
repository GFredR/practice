//
//  ViewController.m
//  pageControl+scrollView
//
//  Created by 郭丰锐 on 2018/1/18.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)NSTimer* timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView* scroolView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, CGRectGetWidth(self.view.frame)-20, 250)];
    for (NSInteger i = 0; i < 5; i++) {
        NSString* imageName = [NSString stringWithFormat:@"%.2ld.jpg",i+1];
        UIImage* images = [UIImage imageNamed:imageName];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*scroolView.frame.size.width, 0, scroolView.frame.size.width, scroolView.frame.size.height)];
        imageView.image = images;
        [scroolView addSubview:imageView];
    }
    //设定视图内容大小（滚动范围）
    scroolView.contentSize = CGSizeMake(scroolView.frame.size.width*5, scroolView.frame.size.height);
    scroolView.contentOffset = CGPointZero;
    scroolView.bounces = NO;
    scroolView.pagingEnabled = YES;
    [scroolView setShowsHorizontalScrollIndicator:NO];
    scroolView.delegate = self;
    scroolView.tag = 100;
    [self.view addSubview:scroolView];
    
    UIPageControl* pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(scroolView.frame.origin.x, scroolView.frame.origin.y + scroolView.frame.size.height - 30, scroolView.frame.size.width, 30)];
    [pageControl setNumberOfPages:5];
    [pageControl setCurrentPage:0];
    //设置圆点颜色
//    [pageControl setPageIndicatorTintColor:[UIColor blackColor]];
//    [pageControl setCurrentPageIndicatorTintColor:[UIColor brownColor]];
    
    pageControl.tag = 99;
    [self.view addSubview:pageControl];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(animateAction:) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)animateAction:(id)sender{
    UIScrollView* scrollView = [self.view viewWithTag:100];
    
    CGPoint currentOffSet = scrollView.contentOffset;
    
    NSInteger index = currentOffSet.x/scrollView.frame.size.width;
    
    index = (index+1)%5;
    
    [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width*(index), 0)];
    UIPageControl* pageControl = [self.view viewWithTag:99];
    [pageControl setCurrentPage:index];
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:scrollView cache:YES];
    [UIView commitAnimations];
    
}
#pragma mark delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    CGPoint currentContentOffSet = scrollView.contentOffset;
    NSInteger index = (NSInteger)currentContentOffSet.x/(NSInteger)scrollView.frame.size.width;
    NSLog(@"index:%ld",index);
    UIPageControl* pageControl = [self.view viewWithTag:99];
    [pageControl setCurrentPage:index];
}

@end
