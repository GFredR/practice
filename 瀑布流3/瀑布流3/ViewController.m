//
//  ViewController.m
//  瀑布流3
//
//  Created by 郭丰锐 on 2018/1/20.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

#import "TouchView.h"
#import "PuBuView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* touchViewArray = @[];
    for (NSInteger i = 1; i<29; i++) {
        
        NSString* imageName = [NSString stringWithFormat:@"32_%ld.jpg",i];
        UIImage* image = [UIImage imageNamed:imageName];
        TouchView* touchVC = [[TouchView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [touchVC setImage:image];
        [touchVC setTittle:@"new"];
        
        
        [touchVC addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchDown];
        touchViewArray = [touchViewArray arrayByAddingObject:touchVC];
    }
    PuBuView* pubuView = [[PuBuView alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.view.frame)-20, CGRectGetHeight(self.view.frame)) view:touchViewArray];
    [self.view addSubview:pubuView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchAction:(TouchView*)sender{
    NSLog(@"sender.tittle:%@ sender.image:%@ ",sender.tittle,sender.image);
   
    DetailViewController* detailVC = [[DetailViewController alloc] init];
    detailVC.lastImage = sender.image;
    detailVC.lastTittle = sender.tittle;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
