//
//  ViewController.m
//  CustomizeUISlider


#import "ViewController.h"

@interface ViewController () {
    NSArray* numbers;
}
@end

@implementation ViewController

@synthesize slider, sliderBackgroundImageView, valueLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    numbers = @[@(0), @(5), @(10), @(15), @(20), @(25), @(30), @(35)];
    // slider values go from 0 to the number of values in your numbers array
    NSInteger numberOfSteps = ((float)[numbers count] - 1);
    slider.maximumValue = numberOfSteps;
    slider.minimumValue = 0;
    [slider setValue:3];
    valueLabel.text = [NSString stringWithFormat:@"%d", 3];
    
    slider.layer.zPosition = 2;
    UIImage *clearImage = [[UIImage alloc] init];
    [slider setMaximumTrackImage:clearImage forState:UIControlStateNormal];
    [slider setMinimumTrackImage:clearImage forState:UIControlStateNormal];
    UIImage *sliderThumbImage = [UIImage imageNamed:@"slider-handler.png"];
    [slider setThumbImage:sliderThumbImage forState:UIControlStateNormal];
    
    sliderBackgroundImageView.image = [UIImage imageNamed:@"sliderbar.png"];
    sliderBackgroundImageView.layer.zPosition = 0;
    
    slider.continuous = YES; // NO makes it call only once you let go
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(drawSliders) userInfo:nil repeats:NO];
    
}

- (void)valueChanged:(UISlider *)sender {
    NSUInteger index = (NSUInteger)(slider.value + 0.5);
    [slider setValue:index animated:NO];
    valueLabel.text = [NSString stringWithFormat:@"%ld", index];
}

-(void)drawSliders {
    CGFloat sliderWidth = slider.frame.size.width - slider.currentThumbImage.size.width;
    CGFloat sliderOriginX = slider.frame.origin.x + slider.currentThumbImage.size.width / 2.0;
    
    UIImage *sliderMarkImage = [UIImage imageNamed:@"slider-mark.png"];
    CGFloat sliderMarkWidth  = sliderMarkImage.size.width;
    CGFloat sliderMarkHeight = sliderMarkImage.size.height;
    CGFloat sliderMarkOriginY = slider.frame.origin.y + slider.frame.size.height / 2.0;
    
    for (NSUInteger index = 0; index < [numbers count]; ++index) {
        CGFloat value = (CGFloat) index;
        CGFloat sliderMarkOriginX = ((value - slider.minimumValue) / (slider.maximumValue - slider.minimumValue)) * sliderWidth + sliderOriginX;
        UIImageView *markImageView = [[UIImageView alloc] initWithFrame:CGRectMake(sliderMarkOriginX - sliderMarkWidth / 2, sliderMarkOriginY - sliderMarkHeight / 2, sliderMarkWidth, sliderMarkHeight)];
        markImageView.image = sliderMarkImage;
        markImageView.layer.zPosition = 1;
        [self.view addSubview:markImageView];
    }
}

@end
