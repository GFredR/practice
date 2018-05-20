//
//  ViewController.m
//  UIToolBar的使用


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationItem.title = @"UIToolBar的使用";
    self.view.backgroundColor = [UIColor grayColor];
    
    //设置UINavigationController的toolbarHidden属性可显示UIToolBar
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    //设置痕迹颜色
    [self.navigationController.toolbar setBarTintColor:[UIColor orangeColor]];
    
    //设置背景图片
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@""] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
    //设置toolbar包含的视图/控制器
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toolbarAction:)];
    item0.tag = 0;
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 50, 20)];
    customView.backgroundColor = [UIColor purpleColor];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:customView];
    item1.tag = 1;
    
    //iOS7以后使用 不然不现实这类图片 有透明效果的可以直接添加
    UIImage *item2Image = [[UIImage imageNamed:@"car.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //直接添加[UIImage imageNamed:@"close.png"]，则不透明的则重画tincolor为默认蓝色
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:item2Image style:UIBarButtonItemStyleDone target:self action:@selector(toolbarAction:)];
    item2.tag = 2;
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"item3" style:UIBarButtonItemStyleDone target:self action:@selector(toolbarAction:)];
    item3.tag = 3;
    
    //间隔符
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //每个Item之间、前后都添加个代表空格的spaceItem
    NSArray *itemsArray = [NSArray arrayWithObjects:spaceItem,item0,spaceItem,item1,spaceItem,item2,spaceItem,item3,spaceItem, nil];
    self.toolbarItems = itemsArray;
    
}

-(void)toolbarAction:(UIBarButtonItem*)sender{
    
    NSLog(@"toolbarItems : %ld ",sender.tag);
    
    switch (sender.tag) {
        case 0:{ } break;
        case 1:{ } break;
        case 2:{ } break;
        case 3:{ } break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
