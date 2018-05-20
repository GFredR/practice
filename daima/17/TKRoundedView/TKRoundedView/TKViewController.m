//
//  TKViewController.m
//  TKRoundedView


#import "TKViewController.h"
#import "TKRoundedView.h"

@interface TKViewController ()
@property (nonatomic, strong) UISwitch *aSwitch;
@property (nonatomic, strong) UILabel *label;
@end

@implementation TKViewController

- (id)init{
    self = [super initWithNibName:nil bundle:nil];
    if(!self)return nil;
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.aSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 90 , self.view.frame.size.height - 34, 88, 44)];
    [self.view addSubview:_aSwitch];
    [_aSwitch addTarget:self action:@selector(switchSwitched:) forControlEvents:UIControlEventValueChanged];
    _aSwitch.on = NO;
    
    [self switchSwitched:_aSwitch];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 34, self.view.frame.size.width - 105 , _aSwitch.frame.size.height)];
    _label.text = @"borders on/off";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor blackColor];
    [self.view addSubview:_label];
}

- (void)switchSwitched:(UISwitch *)theSwitch{
    [self showCornersOrBorders:theSwitch.on];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)showCornersOrBorders:(BOOL)corners{
    
    for (UIView *subview in self.view.subviews) {
        if (subview != _aSwitch && subview != _label) {
            [subview removeFromSuperview];    
        }
    
    }
    
    CGFloat offset = 10.0f;
    
    CGFloat side = (self.view.frame.size.width - 4 * offset)/ 3.0f ;
    
    CGRect frame = CGRectMake(offset, offset, side, side);
    
    if (corners) {
        
        TKRoundedCorner cornerOptions[13] = {
            TKRoundedCornerNone,
            TKRoundedCornerAll,
            TKRoundedCornerTopLeft,
            TKRoundedCornerTopRight,
            TKRoundedCornerBottomRight,
            TKRoundedCornerBottomLeft,
            TKRoundedCornerTopLeft | TKRoundedCornerTopRight,
            TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight,
            TKRoundedCornerTopLeft | TKRoundedCornerBottomRight,
            TKRoundedCornerBottomLeft | TKRoundedCornerTopRight,
            TKRoundedCornerTopLeft | TKRoundedCornerTopRight,
            TKRoundedCornerTopLeft | TKRoundedCornerTopRight | TKRoundedCornerBottomRight,
            TKRoundedCornerTopLeft | TKRoundedCornerTopRight | TKRoundedCornerBottomLeft,
        };
        
        for (int i = 0; i < 13; i++) {
            
            TKRoundedView *view1 = [[TKRoundedView alloc] initWithFrame:CGRectInset(frame, 10, 10)];
            view1.roundedCorners = cornerOptions[i];
            view1.borderColor = [UIColor colorWithRed:0.123 green:0.435 blue:0.52 alpha:1.0];
            view1.fillColor = [UIColor colorWithWhite:0.6 alpha:0.1];
            view1.borderWidth = 5.0f;
            view1.cornerRadius = side/4;
            [self.view addSubview:view1];
            
            frame.origin.y += side + offset;
            
            if (self.view.frame.size.height < CGRectGetMaxY(frame)) {
                frame.origin.y = offset;
                frame.origin.x += offset + side;
            }
            
        }
    }
    else{
        
        
        for (int i = 0; i < 10; i++) {
            
            TKRoundedView *view1 = [[TKRoundedView alloc] initWithFrame:frame];
            
            
            if (i == 0) {
                view1.roundedCorners = TKRoundedCornerTopLeft | TKRoundedCornerTopRight;
                view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesTop | TKDrawnBorderSidesRight;
            }
            else if(i == 1){
                view1.roundedCorners = TKRoundedCornerBottomLeft | TKRoundedCornerBottomRight;
                view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom | TKDrawnBorderSidesRight;
            }
            else if(i == 2){
                view1.roundedCorners = TKRoundedCornerNone;
                view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesRight;
            }
            else if(i == 3){
                view1.roundedCorners = TKRoundedCornerAll;
                view1.drawnBordersSides = TKDrawnBorderSidesAll;
            }
            else if(i == 4){
                view1.roundedCorners = TKRoundedCornerBottomLeft | TKRoundedCornerTopLeft;
                view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom | TKDrawnBorderSidesTop;
            }
            else if(i == 5){
                view1.roundedCorners = TKRoundedCornerBottomRight | TKRoundedCornerTopRight;
                view1.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesBottom | TKDrawnBorderSidesTop;
            }
            else if(i == 6){
                view1.roundedCorners = TKRoundedCornerNone;
                view1.drawnBordersSides = TKDrawnBorderSidesTop| TKDrawnBorderSidesBottom;
            }
            else if(i == 7){
                view1.roundedCorners = TKRoundedCornerNone;
                view1.drawnBordersSides = TKDrawnBorderSidesAll;
            }
            else if(i == 8){
                view1.roundedCorners = TKRoundedCornerBottomRight;
                view1.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesBottom;
            }
            else if(i == 9){
                view1.roundedCorners = TKRoundedCornerTopLeft;
                view1.drawnBordersSides = TKDrawnBorderSidesLeft | TKDrawnBorderSidesTop;
            }
            
            view1.borderColor = [UIColor colorWithRed:0.123 green:0.435 blue:0.52 alpha:1.0];
            view1.fillColor = [UIColor redColor];;
            view1.borderWidth = 5.0f;
            view1.cornerRadius = 30.0f;
            [self.view addSubview:view1];
            
            frame.origin.y += offset + side;
            
            if (self.view.frame.size.height < CGRectGetMaxY(frame)) {
                frame.origin.y = offset;
                frame.origin.x += offset + side;
            }
            
        }
        
    }
    
    [self.view bringSubviewToFront:_aSwitch];

}

@end
