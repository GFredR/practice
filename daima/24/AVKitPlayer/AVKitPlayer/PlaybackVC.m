//
//  PlaybackVC.m


#import "PlaybackVC.h"

@import AVFoundation;
@import AVKit;

@interface PlaybackVC ()

@property (weak, nonatomic) IBOutlet UIButton *audioButton;

@property (weak, nonatomic) AVPlayer *topVideoPlayer;
@property (weak, nonatomic) AVPlayer *bottomVideoPlayer;

@end

@implementation PlaybackVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)onSwitchButtonTapped:(UIButton *)sender { // switch videos and preserve playback time
    
    CMTime topVideoTime = self.topVideoPlayer.currentTime;
    CMTime bottomVideoTime = self.bottomVideoPlayer.currentTime;
    
    AVPlayerItem *topPlayerItem = [AVPlayerItem playerItemWithURL:self.topVideo];
    AVPlayerItem *bottomPlayerItem = [AVPlayerItem playerItemWithURL:self.bottomVideo];
    
    [self.bottomVideoPlayer replaceCurrentItemWithPlayerItem:topPlayerItem];
    [self.bottomVideoPlayer seekToTime:topVideoTime];
    [self.bottomVideoPlayer play];
    
    [self.topVideoPlayer replaceCurrentItemWithPlayerItem:bottomPlayerItem];
    [self.topVideoPlayer seekToTime:bottomVideoTime];
    [self.topVideoPlayer play];
    
    // replace properties for next switch
    NSURL *topVideoCopy = [self.topVideo copy];
    NSURL *bottomVideoCopy = [self.bottomVideo copy];
    self.bottomVideo = topVideoCopy;
    self.topVideo = bottomVideoCopy;
}

- (IBAction)onAudioButtonTapped:(UIButton *)sender { // rotate muting of either, none, and both videos
    
    if ([sender.titleLabel.text isEqualToString:@"Audio 🔇"]) {
        
        [self.audioButton setTitle:@"Audio 🔊" forState:UIControlStateNormal];
        self.topVideoPlayer.muted = false;
        self.bottomVideoPlayer.muted = false;
        
    } else if ([sender.titleLabel.text isEqualToString:@"Audio 🔊"]) {
        
        [self.audioButton setTitle:@"Audio ⤴" forState:UIControlStateNormal];
        self.bottomVideoPlayer.muted = true;
        
    } else if ([sender.titleLabel.text isEqualToString:@"Audio ⤴"]) {
    
        [self.audioButton setTitle:@"Audio ⤵" forState:UIControlStateNormal];
        self.topVideoPlayer.muted = true;
        self.bottomVideoPlayer.muted = false;
        
    } else {
        
        [self.audioButton setTitle:@"Audio 🔇" forState:UIControlStateNormal];
        self.topVideoPlayer.muted = true;
        self.bottomVideoPlayer.muted = true;
    }
}

- (IBAction)onLoopButtontapped:(UIButton *)sender {
 
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"playTopVideo"]) { // play topVideo
        
        AVPlayerViewController *topVideoVC = segue.destinationViewController;
        topVideoVC.player = [AVPlayer playerWithURL:self.topVideo];
        topVideoVC.player.muted = true;
        [topVideoVC.player play];
        
        self.topVideoPlayer = topVideoVC.player; // create weak reference for later
    }
    
    if ([segue.identifier isEqualToString:@"playBottomVideo"]) { // play bottomVideo
        
        AVPlayerViewController *bottomVideoVC = segue.destinationViewController;
        bottomVideoVC.player = [AVPlayer playerWithURL:self.bottomVideo];
        bottomVideoVC.player.muted = true;
        [bottomVideoVC.player play];
        
        self.bottomVideoPlayer = bottomVideoVC.player; // create weak reference for later
    }
}

@end
