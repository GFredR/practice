//
//  ForceTouchSurface.m


#import "HGForceTouchView.h"
#import <AudioToolbox/AudioServices.h>

@implementation HGForceTouchView
#pragma mark - Initializer
- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self == nil) {
        self = [[HGForceTouchView alloc] initWithFrame:frame];
    }
    
    //    self.containerView = [[UIView alloc] initWithFrame:self.bounds];
    //    [self addSubview:self.containerView];
    
    [self start];
    
    return self;
}

- (void)awakeFromNib {
    [self start];
}

- (void)start {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .1;
    self.lastX = 0;
    self.lastY = 0;
    self.lastZ = 0;
    self.timePressing = 0;
    countPressing = FALSE;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    if (self.lastX == 0.00 && self.lastY == 0.00 && self.lastZ == 0.00) {
        self.lastX = acceleration.x;
        self.lastY = acceleration.y;
        self.lastZ = acceleration.z;
    }
    
    if (countPressing) {
        countPressing = FALSE;

        if (((-self.lastZ) + acceleration.z) >= 0.05 || ((-self.lastZ) + acceleration.z) <= -0.05) {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
            [self.forceTouchDelegate viewDidForceTouched:self];
        }
    }
    
    self.lastX = acceleration.x;
    self.lastY = acceleration.y;
    self.lastZ = acceleration.z;
    
}

#pragma mark - HGScrollViewSlide delegate callers

- (void)countTime {
    countPressing = TRUE;
    self.timePressing += 0.01;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    mainTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countTime) userInfo:nil repeats:TRUE];
    [mainTimer fire];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.timePressing = 0.00f;
    [mainTimer invalidate];
    countPressing = FALSE;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.timePressing = 0.00f;
    [mainTimer invalidate];
    countPressing = FALSE;
}

@end


