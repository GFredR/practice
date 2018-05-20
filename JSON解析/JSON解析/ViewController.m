//
//  ViewController.m
//  JSON解析
//
//  Created by 郭丰锐 on 2018/1/29.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL* url = [NSURL URLWithString:@"http://192.168.1.3/demo.json"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15.0];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@",data);
        
        NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"%@",response);
        NSLog(@"%@",json);
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@,%@",result,[result class]);
        for (NSDictionary* dic in result) {
            NSLog(@"==>%@",dic);
        }
        //NSLog(@"%@",[NSThread currentThread]);
        }];
        //[self.webView loadHTMLString:json baseURL:nil];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
