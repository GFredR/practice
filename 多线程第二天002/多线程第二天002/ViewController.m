//
//  ViewController.m
//  多线程第二天002
//
//  Created by 郭丰锐 on 2018/1/24.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,weak)UIImageView* imageView;
@property(nonatomic,weak)UIImage* image;
@end

@implementation ViewController

- (void)loadView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2.0;
    self.view = self.scrollView;
    
    UIImageView* iv = [[UIImageView alloc] init];
    [self.view addSubview:iv];
    self.imageView = iv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //利用GCD加载图片
    //异步执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1516784996546&di=d4cb565ec6be0453540307d93180f90b&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fd53f8794a4c27d1e4a71399a18d5ad6eddc4381c.jpg"];
        NSData* data = [NSData dataWithContentsOfURL:url];
        UIImage* image = [UIImage imageWithData:data];
        self.image = image;
        //更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            [self.imageView sizeToFit];
            self.scrollView.contentSize = image.size;
        });
    });
    
    [self downLoadImage];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)downLoadImage {
    
}

- (void)setImage:(UIImage *)image{
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.scrollView.contentSize = image.size;
}

- (nullable UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"%@",NSStringFromCGAffineTransform(self.imageView.transform));
}





@end
