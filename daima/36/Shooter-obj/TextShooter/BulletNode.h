//
//  BulletNode.h


#import <SpriteKit/SpriteKit.h>

@interface BulletNode : SKNode

+ (instancetype)bulletFrom:(CGPoint)start toward:(CGPoint)destination;
- (void)applyRecurringForce;

@end
