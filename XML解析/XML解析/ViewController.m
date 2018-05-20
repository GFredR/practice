//
//  ViewController.m
//  XML解析
//
//  Created by 郭丰锐 on 2018/1/30.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"
@interface ViewController ()<NSXMLParserDelegate>
@property(strong, nonatomic)NSMutableArray* videos;
@property(strong, nonatomic)Video* currentVideo;
@property(strong, nonatomic)NSMutableString* elmentStr;

@end

@implementation ViewController

-(NSMutableArray *)videos{
    if (!_videos) {
        _videos = [[NSMutableArray alloc]init];
    }
    return _videos;
}

-(NSMutableString *)elmentStr{
    if (!_elmentStr) {
        _elmentStr = [[NSMutableString alloc]init];
    }
    return _elmentStr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    // Do any additional setup after loading the view, typically from a nib.
}





- (void)loadData {
    NSURL* url = [NSURL URLWithString:@"http://192.168.1.6/videos.xml"];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:10.0];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //XML解析是一个耗时操作
        NSXMLParser* parser = [[NSXMLParser alloc] initWithData:data];
        //设置代理一旦解析器开始解析，后续工作就会由代理来监听
        parser.delegate = self;
        //解析器解析
        [parser parse];
    }];
    
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"1.开始文档");
    [self.videos removeAllObjects];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"%@  %@  ",elementName,attributeDict);
    if ([elementName isEqualToString:@"video"]) {
        self.currentVideo = [[Video alloc]init];
        
        self.currentVideo.videoId = @([attributeDict [@"videoId"]intValue]);
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"---%@",string);
    [self.elmentStr appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"结束节点---%@",elementName);
    if ([elementName isEqualToString:@"video"]) {
        [self.videos addObject:self.currentVideo];
    }else if (![elementName isEqualToString:@"name"]){
        [self.currentVideo setValue:self.elmentStr forKey:elementName];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"结束解析%@",self.videos);
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    
    NSLog(@"出现错误");
}




















@end
