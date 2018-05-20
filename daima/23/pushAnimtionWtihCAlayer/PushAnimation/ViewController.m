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


- (IBAction)didTap:(id)sender {
    if (self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    
    ViewController * vc2 =[[ViewController alloc]initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
    
    vc2.view.backgroundColor =[UIColor colorWithRed:1.000 green:0.000 blue:0.502 alpha:1.000];
    
    vc2.imageView.image = [UIImage imageNamed:@"b.jpg"];
    
    [self.navigationController pushViewController:vc2 animated:YES];
}
@end
