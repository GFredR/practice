//
//  ViewController.m
//  图片轮播器


#import "ViewController.h"
#define screenW self.view.frame.size.width
#define screenH self.view.frame.size.height
#define numImageCount 4
@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scrollView;

@property (nonatomic,weak)UIPageControl * pageControl;

@property (nonatomic,strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    CGFloat scrollViewW = screenW-10;
    scrollView.frame = CGRectMake(5, 5, scrollViewW,180);
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(scrollViewW*numImageCount, 0);
    scrollView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    self.scrollView = scrollView;
    
    for (int i = 0; i < numImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        CGFloat imageViewY = 0;
        CGFloat imageViewW = scrollViewW;
        CGFloat imageViewH = 200;
        CGFloat imageViewX = i * imageViewW;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        [self.scrollView addSubview:imageView];
        NSString *name = [NSString stringWithFormat:@"function_guide_%d",i+1];
        imageView.image = [UIImage imageNamed:name];
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    CGFloat pageW = 60;
    CGFloat pageH = 30;
    CGFloat pageX = screenW /2- pageW/2;
    CGFloat pageY = 160;
    pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    //设置pagecontrol的总页数
    pageControl.numberOfPages = 5;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    [self addTimer];
 }
-(void)playImage
{
    //增加pageControl的页码
    int page = 0;
    if (self.pageControl.currentPage == numImageCount-1) {
        page = 0;
    }else{
        page = self.pageControl.currentPage+1;
    }
    //计算scrollView的滚动位置
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollW = scrollView.frame.size.width;
    CGFloat width = scrollView.contentOffset.x;
    int page = (width  + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    //停止定时器,定时器停止了，就不能使用了。
    [self.timer invalidate];
    self.timer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //开启定时器
    [self addTimer];
    
}
-(void)addTimer
{
    //添加定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(playImage) userInfo:nil repeats:YES];
    //消息循环，添加到主线程
    //默认没有优先级
//    extern NSString* const NSDefaultRunLoopMode;
    //提高优先级
//    extern NSString* const NSRunLoopCommonModes;

    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

@end
