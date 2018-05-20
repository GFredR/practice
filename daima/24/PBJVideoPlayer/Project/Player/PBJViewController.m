//
//  PBJViewController.m

#import "PBJViewController.h"
#import "PBJVideoPlayerController.h"

static NSString * const PBJViewControllerVideoPath = @"http://distilleryvesper7-3.ak.instagram.com/fdc51d8ea73611e3a15612e740d32ce3_101.mp4";

@interface PBJViewController () <
    PBJVideoPlayerControllerDelegate>
{
    PBJVideoPlayerController *_videoPlayerController;
    UIImageView *_playButton;
}

@end

@implementation PBJViewController

#pragma mark - UIViewController status bar

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    _videoPlayerController = [[PBJVideoPlayerController alloc] init];
    _videoPlayerController.delegate = self;
    _videoPlayerController.view.frame = self.view.bounds;
    
    [self addChildViewController:_videoPlayerController];
    [self.view addSubview:_videoPlayerController.view];
    [_videoPlayerController didMoveToParentViewController:self];

    _playButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"play_button"]];
    _playButton.center = self.view.center;
    [self.view addSubview:_playButton];
    [self.view bringSubviewToFront:_playButton];
    
    _videoPlayerController.videoPath = PBJViewControllerVideoPath;
}

#pragma mark - PBJVideoPlayerControllerDelegate

- (void)videoPlayerReady:(PBJVideoPlayerController *)videoPlayer
{
    //NSLog(@"Max duration of the video: %f", videoPlayer.maxDuration);
}

- (void)videoPlayerPlaybackStateDidChange:(PBJVideoPlayerController *)videoPlayer
{
}

- (void)videoPlayerBufferringStateDidChange:(PBJVideoPlayerController *)videoPlayer
{
    /*switch (videoPlayer.bufferingState) {
     case PBJVideoPlayerBufferingStateUnknown:
     NSLog(@"Buffering state unknown!");
     break;
     
     case PBJVideoPlayerBufferingStateReady:
     NSLog(@"Buffering state Ready! Video will start/ready playing now.");
     break;
     
     case PBJVideoPlayerBufferingStateDelayed:
     NSLog(@"Buffering state Delayed! Video will pause/stop playing now.");
     break;
     default:
     break;
     }*/
}

- (void)videoPlayerPlaybackWillStartFromBeginning:(PBJVideoPlayerController *)videoPlayer
{
    _playButton.alpha = 1.0f;
    _playButton.hidden = NO;

    [UIView animateWithDuration:0.1f animations:^{
        _playButton.alpha = 0.0f;
    } completion:^(BOOL finished) {
        _playButton.hidden = YES;
    }];
}

- (void)videoPlayerPlaybackDidEnd:(PBJVideoPlayerController *)videoPlayer
{
    _playButton.hidden = NO;

    [UIView animateWithDuration:0.1f animations:^{
        _playButton.alpha = 1.0f;
    } completion:^(BOOL finished) {
    }];
}

@end
