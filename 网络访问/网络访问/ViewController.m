//
//  ViewController.m
//  网络访问
//
//  Created by 郭丰锐 on 2018/1/29.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL* url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    /*
     timeoutInterval:超时时长
     一般在开发中建议：15s-30s，太短服务器来不及反应，太长用户体验不好
     -SDWebImage，默认时长15s
     -AFNetworking，默认时长60s
     */
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15.0];
    
    [request setValue:@"iPhone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
    /*
     
     * 1.request --索要资源的请求
     * 2.queue ---调度任务队列
     指定回调队列代码块的队列！
     主队列：回调代码块在主线程上执行
     新建队列：就会在其他线程上执行你的回调代码
     
     * 3.block ---回调代码块，在网络请求结束后执行！
     *3.1 response 服务器的响应
     URL           服务器返回的URl,绝大部分都和请求URL是一样的，有时候不一样，“重定向”
     MIMEType      二进制数据的文件类型，服务器会告诉客户端，用什么打开二进制数据
     expectedContentLength  下载文件的长度
     textEncodingName      文件编码名称 大多数的UT8
     suggestedFilename     服务器建议保存的文件名称
     statusCode;           状态码 2XX 3XX重定向  4XX客户端错误 5XX服务器错误
     allHeaderFields       所有响应头的内容
     * data 数据实体，程序员最关注的部分
     * connectionError 错误提示
     注意：有一种情况没有错误，也没有数据
     if(connectionError || data == nil)
     {
     NSLog(@“你的网络不给力，请稍后重试！”)；
     }
     
     */
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@",data);
        [data writeToFile:@"/Users/guofengrui/Desktop/假期iOS深度学习/CC进阶/20170829-进阶-第五天- 网络编程（1）/源码/GFR_666 "atomically:YES];
        NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",response);
        NSLog(@"%@",json);
        NSLog(@"%@",[NSThread currentThread]);
        
        [self.webView loadHTMLString:json baseURL:nil];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
