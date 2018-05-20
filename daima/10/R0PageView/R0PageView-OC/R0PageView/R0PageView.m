//
//  R0PageView.m
//  R0PageView-OC

#import "R0PageView.h"

static const int ImageViewCount = 3;

@interface R0PageView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation R0PageView

+ (instancetype)pageView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

#pragma - mark setter

- (void)setImagesName:(NSArray *)imagesName {
    _imagesName = imagesName;
    
    if (!imagesName.count) {
        return;
    } else if (imagesName.count == 1) {
        self.scrollView.scrollEnabled = NO;
        self.pageControl.numberOfPages = 1;
    }
    // 判断原来是不是有值，如果有值，就把scrollView里面的元素全部删除
    if (self.scrollView.subviews.count) {
        [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    for (int i = 0; i < ImageViewCount; i++) {
        NSInteger index = i;
        if (i == 0) {
            // 默认显示3个ImageView的中间那个，而最左边的则要加载数组中最后一个图片
            index = imagesName.count - 1;
        }
        if (index >= imagesName.count) {
            index = 0;
        }
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imagesName[index]];
        // 给tag加值，用于在后面取出判断pageControl的当前页
        imageView.tag = i;
        [self.scrollView addSubview:imageView];
    }
    self.pageControl.numberOfPages = imagesName.count;
    
    
}

- (void)setCurrentIndicatorColor:(UIColor *)currentIndicatorColor {
    self.pageControl.currentPageIndicatorTintColor = currentIndicatorColor;
}

- (void)setPageIndicatorColor:(UIColor *)pageIndicatorColor {
    self.pageControl.pageIndicatorTintColor = pageIndicatorColor;
}

- (void)setTimerInterval:(NSTimeInterval)timerInterval {
    _timerInterval = timerInterval;
    if (!self.imagesName.count) {
        return;
    }
    if (timerInterval < 0) {
        _timerInterval = 2.0;
    }
    if (_timerInterval) {
        [self startTimer];
    }
}

/**
 *  初始设置
 */
- (void)setup {
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPage = 0;
    [self startTimer];
}

/**
 *  处理点击事件
 */
- (void)tap:(UITapGestureRecognizer *)gesture {
    if ([self.delegate respondsToSelector:@selector(pageViewDidClick:atCurrentPage:)]) {
        [self.delegate pageViewDidClick:self atCurrentPage:self.pageControl.currentPage];
    };
}

- (void)awakeFromNib {
    [self setup];
    
    // 添加点击监听
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
    [gesture addTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:gesture];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置scrollView的contentSize
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * ImageViewCount, 0);
    
    if (self.imagesName.count) {
        // 设置UIImageView的frame
        for (int i = 0; i < ImageViewCount; i++) {
            UIImageView *imageView = self.scrollView.subviews[i];
            CGFloat imageW = self.frame.size.width;
            imageView.frame = CGRectMake(i * imageW, 0, imageW, self.frame.size.height);
        }
        
        [self updateContent];
    }
}

#pragma - mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = 0;
    
    // 找出应该在中间的那个UIImageView是第几个，然后设置pageControl的当前页
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i < self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        CGFloat distance = ABS(self.scrollView.contentOffset.x - imageView.frame.origin.x);
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    
    self.pageControl.currentPage = page;
}

/**
 *  当手动翻页的时候，停止定时器
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

/**
 *  当松开手指调用，开启定时器，继续自动滚动
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!self.timerInterval) {
        [self startTimer];
    }
}

/**
 *  当手指松开时，scrollView会滚到分割好的页上，有一个减速的过程，当减速结束时会调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updateContent];
}

/**
 *  定时器自动滚动结束时会调用
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self updateContent];
}

/**
 *  更新内容，滚动结束时会调用此方法
 *  滚动结束时会把三个UIImageView的图片全部换掉，显示Array中后面的三张图片。并且设置scrollView的contentOffSet。
 *  在设置contentOffSet之前，当前ScrollView其实显示的是后一个UIImageView，但设置了之后ScrollView会瞬间把中间的那个UIImageView切换到中间来。
 */
- (void)updateContent {
    for (int i = 0; i < ImageViewCount; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        NSInteger index = self.pageControl.currentPage;
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }
        imageView.image = [UIImage imageNamed:self.imagesName[index]];
        imageView.tag = index;
    }
    
    self.scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
}

#pragma - mark 定时器相关

/**
 *  开启定时器，实现自动翻页
 */
- (void)startTimer {
    NSTimeInterval timerInterval = self.timerInterval;
    if (!timerInterval) {
        timerInterval = 2.0;
    }
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(next) userInfo:nil repeats:YES];
    // 把当前的Timer加入到主线程去
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)stopTimer {
    [self.timer invalidate];
}

/**
 *  显示下一张图片，使用setContentOffset:animated:，在ScrollView结束动画时会调用scrollViewDidEndScrollingAnimation:
 */
- (void)next {
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:YES];
}

@end
