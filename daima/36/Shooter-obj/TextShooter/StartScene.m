//
//  StartScene.m


#import "StartScene.h"
#import "GameScene.h"

@implementation StartScene
- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor greenColor];
        
        SKLabelNode *topLabel = [SKLabelNode labelNodeWithFontNamed:@"gxj"];
        topLabel.text = @"Shooter射击游戏";
        topLabel.fontColor = [SKColor blackColor];
        topLabel.fontSize = 48;
        topLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                        self.frame.size.height * 0.7);
        [self addChild:topLabel];
        
        SKLabelNode *bottomLabel = [SKLabelNode labelNodeWithFontNamed:
                                    @"gxj"];
        bottomLabel.text = @"点击屏幕开始游戏！";
        bottomLabel.fontColor = [SKColor blackColor];
        bottomLabel.fontSize = 20;
        bottomLabel.position = CGPointMake(self.frame.size.width * 0.5,
                                           self.frame.size.height * 0.3);
        [self addChild:bottomLabel];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SKTransition *transition = [SKTransition doorwayWithDuration:1.0];
    SKScene *game = [[GameScene alloc] initWithSize:self.frame.size];
    [self.view presentScene:game transition:transition];
    
    [self runAction:[SKAction playSoundFileNamed:@"gameStart.wav"
                               waitForCompletion:NO]];
}

@end