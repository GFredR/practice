//
//  InterfaceController.m


#import "InterfaceController.h"

@interface InterfaceController()

@property (nonatomic, weak) IBOutlet WKInterfaceGroup *circleGroup;
@property (nonatomic, weak) IBOutlet WKInterfaceGroup *firstScreenGroup;

@end

@implementation InterfaceController

// Circle Direction buttons

- (IBAction)leftButtonPressed {
    [self animateWithDuration:0.5 animations:^{
        [self.circleGroup setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentLeft];
    }];
}

- (IBAction)rightButtonPressed {
    [self animateWithDuration:0.5 animations:^{
        [self.circleGroup setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentRight];
    }];
}

- (IBAction)upButtonPressed {
    [self animateWithDuration:0.5 animations:^{
        [self.circleGroup setVerticalAlignment:WKInterfaceObjectVerticalAlignmentTop];
    }];
}

- (IBAction)downButtonPressed {
    [self animateWithDuration:0.5 animations:^{
        [self.circleGroup setVerticalAlignment:WKInterfaceObjectVerticalAlignmentBottom];
    }];
}

- (IBAction)pushButtonPressed {
    [self animateWithDuration:0.1 animations:^{
        [self.firstScreenGroup setAlpha:0];
    }];
    
    [self animateWithDuration:0.3 animations:^{
        [self.firstScreenGroup setWidth:0];
    }];
}

- (IBAction)popButtonPressed {
    [self animateWithDuration:0.3 animations:^{
        [self.firstScreenGroup setRelativeWidth:1 withAdjustment:0];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animateWithDuration:0.1 animations:^{
            [self.firstScreenGroup setAlpha:1];
        }];
    });
}

@end
