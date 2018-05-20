//
//  ActionViewController.m


#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>

#define YouDaoAPIkey @"1758340821"
#define Keyfrom @"MKActionExtension"

@interface ActionViewController ()

@end

@implementation ActionViewController
{
    __weak IBOutlet UITextView *originalTextView;
    
    __weak IBOutlet UITextView *translateTextView;
    __weak IBOutlet UIActivityIndicatorView *activityView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadInputItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadInputItems
{
    //1. 从扩展上下文获取 NSExtensionItem 数组
    NSArray<NSExtensionItem *> *itemArray = self.extensionContext.inputItems;
    
    //2. 从 NSExtensionItem 获取 NSItemProvider 数组
    NSExtensionItem *item = itemArray.firstObject;
    NSArray<NSItemProvider *> *providerArray = item.attachments;
    
    //3. 加载、获取数据
    NSItemProvider *itemProvider = providerArray.firstObject;
    if([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypePlainText]){
        [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypePlainText options:nil completionHandler:^(NSString *text, NSError *error) {
            if(text) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    originalTextView.text = text;
                    
                    //4. 翻译
                    [self youdaoTranslate:text complate:^(NSString *translateText) {
                        translateTextView.text = translateText;
                    }];
                }];
            }
        }];
    }
}


- (void)youdaoTranslate:(NSString *)text complate:(void (^)(NSString *))complate{
    [activityView startAnimating];
    
    NSURLSession *shareSession = [NSURLSession sharedSession];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *urlStr = [NSString stringWithFormat:@"http://fanyi.youdao.com/openapi.do?keyfrom=%@&key=%@&type=data&doctype=json&version=1.1&q=%@", Keyfrom, YouDaoAPIkey, text];
    
    NSURLSessionDataTask *task = [shareSession dataTaskWithURL:[NSURL URLWithString: urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *resultArray = dic[@"translation"];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [activityView stopAnimating];
            complate(resultArray[0]);
        }];
    }];
    [task resume];
}

- (void)speakText:(NSString *)text{
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    [utterance setRate:0.1];
    [synthesizer speakUtterance:utterance];
}
- (IBAction)goSpeak:(id)sender {
    [self speakText: originalTextView.text];
}

- (IBAction)translate:(id)sender {
    [self youdaoTranslate:originalTextView.text complate:^(NSString *translateText) {
        translateTextView.text = translateText;
    }];
}

- (IBAction)done {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
    [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
}

@end
