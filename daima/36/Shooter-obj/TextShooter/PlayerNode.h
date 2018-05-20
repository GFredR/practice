//
//  PlayerNode.h


#import <SpriteKit/SpriteKit.h>

@interface PlayerNode : SKNode

// returns duration of future movement
- (void)moveToward:(CGPoint)location;

@end
