//
//  PBJVideoView.m

#import "PBJVideoView.h"

#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface PBJVideoView ()
{
}

@end

@implementation PBJVideoView

+ (Class)layerClass
{
	return [AVPlayerLayer class];
}

#pragma mark - getters/setters

- (void)setPlayer:(AVPlayer *)player
{
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}

- (AVPlayer *)player
{
    return [(AVPlayerLayer *)[self layer] player];
}

- (AVPlayerLayer *)playerLayer
{
    return (AVPlayerLayer *)self.layer;
}

- (void)setVideoFillMode:(NSString *)videoFillMode
{
    AVPlayerLayer *playerLayer = (AVPlayerLayer *)[self layer];
	playerLayer.videoGravity = videoFillMode;
}

- (NSString *)videoFillMode
{
    AVPlayerLayer *playerLayer = (AVPlayerLayer *)[self layer];
	return playerLayer.videoGravity;
}

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.playerLayer.backgroundColor = [[UIColor blackColor] CGColor];
    }
    return self;
}

@end
