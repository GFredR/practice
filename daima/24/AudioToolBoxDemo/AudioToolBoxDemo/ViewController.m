//
//  ViewController.m


#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self playShortAudio];
}

//短音频播放完成的回调方法
void callBack(SystemSoundID ID, void  * clientData){
    
    NSLog(@"test");
}

//播放短音频(<30s)
-(void)playShortAudio{
    
    //获取短音频文件路径
    NSURL *audioURL=[[NSBundle mainBundle] URLForResource:@"音效" withExtension:@"caf"];
    
    //创建ID
    SystemSoundID soundID;
    //在系统中为短音频创建一个唯一的ID
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(audioURL), &soundID);
    //将创建短音频添加到系统服务中,委托系统来播放短音频
    
    /**
     *  <#Description#>
     *
     *  @param soundID               ID
     *  @param NULL                播放的线程
     *  @param inRunLoopMode#>       播放的线程
     description#>
     *  @param inCompletionRoutine#>回调
     description#>
     *  @param inClientData#>        
     description#>
     *
     *  @return <#return value description#>
     */
    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, &callBack, NULL);
    //播放短音频
    AudioServicesPlayAlertSound(soundID);
    
//    NSRunLoop  消息循环
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
