//
//  ViewController.m
//  UIWebViewDemo


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // self.view.backgroundColor = [UIColor blackColor];
    Slide = [[UISlider alloc] initWithFrame:CGRectMake(50, 10, 1000, 20)];
    [Slide addTarget:self action:@selector(SlideChange) forControlEvents:UIControlEventValueChanged];
    Slide.maximumValue = 1000.0f;
    Slide.minimumValue =10.0f;
    Slide.value = 10.0f;
    [self.view addSubview:Slide];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,40,1024, 728)];
    _webView.delegate = self;
    

    [self.view addSubview:_webView];
    
    NSURL* url = [NSURL URLWithString:@"http://m.baidu.com"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
    
	activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40, 50)];
    activityIndicator.center = self.view.center;
    activityIndicator.backgroundColor = [UIColor grayColor];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator startAnimating];
    [self.view addSubview:activityIndicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)SlideChange
{
    NSString* str1 =[NSString stringWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%f%%'",Slide.value];
    [_webView stringByEvaluatingJavaScriptFromString:str1];
    
}

@end
