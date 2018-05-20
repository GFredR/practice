//
//  ZViewController.m
//  OC+JavaScript
//


#import "ZViewController.h"

@interface ZViewController ()<UIWebViewDelegate>
{
    BOOL isFirstLoadWeb;
}
@property (nonatomic,retain) UIWebView *webview;

@end

@implementation ZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    _webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    _webview.backgroundColor = [UIColor clearColor];
    _webview.scalesPageToFit =YES;
    _webview.delegate =self;
    [self.view addSubview:_webview];
    
    //注意这里的url为手机端的网址 m.baidu.com，不要写成 www.baidu.com。
    NSURL *url =[[NSURL alloc] initWithString:@"http://m.baidu.com/"];
    NSURLRequest *request =  [[NSURLRequest alloc] initWithURL:url];
    [_webview loadRequest:request];
    [url release];
    [request release];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //程序会一直调用该方法，所以判断若是第一次加载后就使用我们自己定义的js，此后不在调用JS,否则会出现网页抖动现象
    if (!isFirstLoadWeb) {
        isFirstLoadWeb = YES;
    }else
        return;
    //给webview添加一段自定义的javascript
    
    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function myFunction() { "
     
    //注意这里的Name为搜索引擎的Name,不同的搜索引擎使用不同的Name
    //<input type="text" name="word" maxlength="64" size="20" id="word"/> 百度手机端代码
     "var field = document.getElementsByName('word')[0];"
     
     //给变量取值，就是我们通常输入的搜索内容，这里为 code4app.com
     "field.value='toppr.net';"
     
     "document.forms[0].submit();"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    
    //开始调用自定义的javascript
    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
    
    //以上内容均参考自互联网，再次分享给互联网
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [_webview release];
    [super dealloc];
}
@end
