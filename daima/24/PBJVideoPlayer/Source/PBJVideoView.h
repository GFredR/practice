//
//  PBJVideoView.h

#import <UIKit/UIKit.h>

// PBJVideoPlayerController provides this class via viewController.view, no need to allocate directly

@class AVPlayer;
@class AVPlayerLayer;
@interface PBJVideoView : UIView

@property (nonatomic) AVPlayer *player;
@property (nonatomic, readonly) AVPlayerLayer *playerLayer;

// defaults to AVLayerVideoGravityResizeAspect
@property (nonatomic, readwrite) NSString *videoFillMode;

@end
