//
//  WebViewController.m
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "WebViewController.h"
#import "Model.h"

@interface WebViewController ()
@property(strong, nonatomic)UIWebView* webView;
@property(strong, nonatomic)NSMutableDictionary* dataSource;
@property(strong, nonatomic)NSDictionary* dic;
@property(strong, nonatomic)Model* modelData;
@property(strong, nonatomic)NSDictionary* dataArr;
@end

@implementation WebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSString* filePath = [[NSBundle mainBundle]pathForResource:@"news_detail" ofType:@"json"];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    _dataArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    [_dataArr objectForKey:@"content"];
    [self loadFile];

    [self setNav];

}
- (void)setNav{
    UILabel* title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    title.text = @"详细新闻";
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = title;
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 40);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIImage* imag = [UIImage imageNamed:@"navigationbar_button_background@2x"];
    
    CGFloat top = imag.size.height/2;
    CGFloat bottom = imag.size.height/2;
    CGFloat left = imag.size.width/2;
    CGFloat right = imag.size.width/2;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    
    imag = [imag resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    [btn setBackgroundImage:imag forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadFile{
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    

    [self.webView loadHTMLString:[_dataArr objectForKey:@"content"] baseURL:nil];

    [self.view addSubview:self.webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
