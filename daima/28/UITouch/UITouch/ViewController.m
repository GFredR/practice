//
//  ViewController.m


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 获取到触摸的手指
    UITouch *touch = [touches anyObject]; // 获取集合中对象
    
    // 获取开始时的触摸点
    CGPoint previousPoint = [touch previousLocationInView:self.view];
    
    // 获取当前的触摸点
    CGPoint latePoint = [touch locationInView:self.view];
    
    // 获取当前点的位移量
    CGFloat dx = latePoint.x - previousPoint.x;
    CGFloat dy = latePoint.y - previousPoint.y;
    
    // 获取当前视图的center
    CGPoint center = self.view.center;
    
    // 根据位移量修改center的值
    center.x += dx;
    center.y += dy;
    
    // 把新的center赋给当前视图
    self.view.center = center;
}

@end
