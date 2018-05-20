//
//  ViewController.m


#import "ViewController.h"
#import "ZGDAudioManger.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[ZGDAudioManger shareAudioManger] playAudioSystemSoundWithFile:@"此处输入你要播放的音频文件路径"];
}


@end
