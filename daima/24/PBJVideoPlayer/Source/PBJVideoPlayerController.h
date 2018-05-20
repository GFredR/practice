//
//  PBJVideoPlayerController.h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PBJVideoPlayerPlaybackState) {
    PBJVideoPlayerPlaybackStateStopped = 0,
    PBJVideoPlayerPlaybackStatePlaying,
    PBJVideoPlayerPlaybackStatePaused,
    PBJVideoPlayerPlaybackStateFailed,
};

typedef NS_ENUM(NSInteger, PBJVideoPlayerBufferingState) {
    PBJVideoPlayerBufferingStateUnknown = 0,
    PBJVideoPlayerBufferingStateReady,
    PBJVideoPlayerBufferingStateDelayed,
};

// PBJVideoPlayerController.view provides the interface for playing/streaming videos
@protocol PBJVideoPlayerControllerDelegate;
@interface PBJVideoPlayerController : UIViewController

@property (nonatomic, weak) id<PBJVideoPlayerControllerDelegate> delegate;

@property (nonatomic, copy) NSString *videoPath;
@property (nonatomic, copy, setter=setVideoFillMode:) NSString *videoFillMode; // default, AVLayerVideoGravityResizeAspect

@property (nonatomic) BOOL playbackLoops;
@property (nonatomic) BOOL playbackFreezesAtEnd;
@property (nonatomic, readonly) PBJVideoPlayerPlaybackState playbackState;
@property (nonatomic, readonly) PBJVideoPlayerBufferingState bufferingState;

@property (nonatomic, readonly) NSTimeInterval maxDuration;

- (void)playFromBeginning;
- (void)playFromCurrentTime;
- (void)pause;
- (void)stop;

@end

@protocol PBJVideoPlayerControllerDelegate <NSObject>
@required
- (void)videoPlayerReady:(PBJVideoPlayerController *)videoPlayer;
- (void)videoPlayerPlaybackStateDidChange:(PBJVideoPlayerController *)videoPlayer;

- (void)videoPlayerPlaybackWillStartFromBeginning:(PBJVideoPlayerController *)videoPlayer;
- (void)videoPlayerPlaybackDidEnd:(PBJVideoPlayerController *)videoPlayer;

@optional
- (void)videoPlayerBufferringStateDidChange:(PBJVideoPlayerController *)videoPlayer;

@end
