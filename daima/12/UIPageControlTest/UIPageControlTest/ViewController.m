//
//  ViewController.m
//  UIPageControlTest


#import "ViewController.h"
#import "PageViewController.h"

@implementation ViewController{
	UIScrollView* _scrollView;
	NSMutableArray* _viewControllers;
	UIPageControl* _pageControl;
	NSArray* _contentList;
	NSArray* _coverList;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	_contentList = @[@"东海",
		@"南海",
		@"黄海",
		@"渤海"];
	_coverList = @[@"android.png",
		@"ajax.png",
		@"swift.png",
		@"html.png"];
	NSUInteger numberPages = _contentList.count;
	// 程序将会采用延迟加载的方式来创建PageController控制器
	// 因此此处只向数组中添加一些null作为占位符，
	// 等到程序需要时才真正创建PageController
	_viewControllers = [[NSMutableArray alloc] init];
	for (NSUInteger i = 0; i < numberPages; i++)
	{
		[_viewControllers addObject:[NSNull null]];
	}
	// 创建UIScrollView对象
	_scrollView = [[UIScrollView alloc]
		initWithFrame:[[UIScreen mainScreen] bounds]];
	// 设置背景色
	_scrollView.backgroundColor = [UIColor grayColor];
	_scrollView.pagingEnabled = YES;
	// 设置UIScrollPane的contentSize——就是它可滚动区域的大小
	_scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame)
		* numberPages, CGRectGetHeight(_scrollView.frame));
	_scrollView.showsHorizontalScrollIndicator = NO;
	_scrollView.showsVerticalScrollIndicator = NO;
	_scrollView.scrollsToTop = NO;
	// 设置该控制作为UIScrollView的委托对象
	_scrollView.delegate = self;
	[self.view addSubview:_scrollView];
	// 创建UIPageControl控件
	_pageControl = [[UIPageControl alloc] init];
	// 设置UIPageControl的大小和位置
	_pageControl.frame = CGRectMake(0, CGRectGetHeight(_scrollView.frame) - 80 , CGRectGetWidth(_scrollView.frame), 80);
	// 设置UIPageControl的圆点的颜色
	_pageControl.pageIndicatorTintColor = [UIColor blueColor];
	// 设置UIPageControl的高亮圆点的颜色
	_pageControl.currentPageIndicatorTintColor = [UIColor redColor];
	// 设置UIPageControl控件当前显示第几页
	_pageControl.currentPage = 0;
	// 设置UIPageControl控件总共包含多少页
	_pageControl.numberOfPages = numberPages;
	_pageControl.hidesForSinglePage = YES;
	// 为pageControl的Value Changed事件绑定事件处理方法
	[_pageControl addTarget:self action:@selector(changePage:)
		forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:_pageControl];
	// 初始化时默认只需加载、显示第一页的View
	[self loadScrollViewWithPage:0];
	// 为了避免“翻页”时才加载下一页导致删除，同时把下一页的View也加载出来
	[self loadScrollViewWithPage:1];
}
// 自定义方法，用于加载UIScrollPage的指定页对应的控制器
- (void) loadScrollViewWithPage:(NSUInteger)page
{
	// 如果超出总页数，方法直接返回
	if (page >= _contentList.count)
		return;
	// 获取page索引处的控制器
	PageController* controller = _viewControllers[page];
	// 如果page索引处的控制器还没有初始化
	if ((NSNull *)controller == [NSNull null])
	{
		// 创建PageController对象
		controller = [[PageController alloc] initWithPageNumber:page];
		// 用PageController对象替换page索引处原来的对象
		[_viewControllers replaceObjectAtIndex:page withObject:controller];
	}
	// 将controller控制器对应的View添加到UIScrollView中
	if (controller.view.superview == nil)
	{
		CGRect frame = _scrollView.frame;
		frame.origin.x = CGRectGetWidth(frame) * page;
		frame.origin.y = 0;
		// 设置该控制器对应的View的大小和位置
		controller.view.frame = frame;
		// 设置controller控制器的bookLabel控件的文本
		controller.bookLabel.text = _contentList[page];
		controller.bookImage.image = [UIImage imageNamed:_coverList[page]];
		// 将controller控制器添加为当前控制器的子控制器
		[self addChildViewController:controller];
		// 将controller控制器对应的View添加到UIScrollView中
		[_scrollView addSubview:controller.view];
	}
}
// 来自UIScrollViewDelegate的方法，当用户滚动UIScrollView后激发该方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	// 获取UIScrollView控件的宽度，也就是页面的宽度
	CGFloat pageWidth = CGRectGetWidth(scrollView.frame);
	// 用UIScrollView水平滚动的距离减去页面宽度的一半，除以页面宽度的结果再加1，
	// 即可得到当前处于第几页
	NSUInteger page = floor((scrollView.contentOffset.x
		- pageWidth / 2) / pageWidth) + 1;
	// 控制UIPageControl显示当前处于第page页
	_pageControl.currentPage = page;
	// 为了避免“翻页”时才加载上一页、下一页导致闪烁，
	// 因此加载当前页的View时，也把上一页、下一页的View加载出来
	[self loadScrollViewWithPage:page - 1];
	[self loadScrollViewWithPage:page];
	[self loadScrollViewWithPage:page + 1];
}
// 事件监听方法，当用户更改UIPageControl的选中页时激发该方法
- (void) changePage:(id)sender
{
	NSInteger page = [sender currentPage];
	// 创建一个CGRect对象，该CGRect区域代表该UIScrollView将要显示的页
	CGRect bounds = _scrollView.bounds;
	bounds.origin.x = CGRectGetWidth(bounds) * page;
	bounds.origin.y = 0;
	// 控制UIScrollView滚动到指定区域
	[_scrollView scrollRectToVisible:bounds animated:YES];
	// 为了避免“翻页”时才加载上一页、下一页导致闪烁，
	// 因此加载当前页的View时，也把上一页、下一页的View加载出来
	[self loadScrollViewWithPage:page - 1];
	[self loadScrollViewWithPage:page];
	[self loadScrollViewWithPage:page + 1];
}
@end
