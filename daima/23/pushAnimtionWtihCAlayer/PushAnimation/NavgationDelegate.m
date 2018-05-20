//
//  NavgationDelegate.m


#import "NavgationDelegate.h"
#import "ViewController.h"
#import "CircleTransitionAnimator.h"
@implementation NavgationDelegate


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    
//    if (operation == UINavigationControllerOperationPush) {
//        return [[CircleTransitionAnimator alloc]init];
//    }
//    return nil;
    
    if ([fromVC isKindOfClass:[ViewController class]]) {
        return [[CircleTransitionAnimator alloc]init];
    }else
    {
        return nil;
    }

}



- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{

    return self.interactionController;
}



-(void)paned:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            
            //pop
            //开始的时候
            self.interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
            if (self.navigationController.viewControllers.count > 1) {
                [self.navigationController popViewControllerAnimated:YES];
            } else {
                
                
                //push
                
                ViewController * vc2 =[[ViewController alloc]initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
                
                vc2.view.backgroundColor =[UIColor colorWithRed:1.000 green:0.000 blue:0.502 alpha:1.000];
                
                vc2.imageView.image = [UIImage imageNamed:@"b.jpg"];
                
                [self.navigationController pushViewController:vc2 animated:YES];
            }

            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            
            CGPoint translation = [gestureRecognizer  translationInView:self.navigationController.view];
            
            CGFloat completionProgress = translation.x/CGRectGetWidth(self.navigationController.view.bounds);
            
            [ self.interactionController updateInteractiveTransition:completionProgress];

            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
          if(  [gestureRecognizer velocityInView:self.navigationController.view].x>0)
          {
              [self.interactionController finishInteractiveTransition];
          }else
          {
              [self.interactionController cancelInteractiveTransition];
          }
            self.interactionController = nil;
            
            break;
        }

        default:
        {
            [self.interactionController cancelInteractiveTransition];

            self.interactionController = nil;
        }
            break;
    }
}


#pragma mark - setter && getter 

-(void)setNavigationController:(UINavigationController *)navigationController
{
    _navigationController = navigationController;
    
    UIPanGestureRecognizer * pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(paned:)];
    
    [self.navigationController.view addGestureRecognizer:pan];
    
    
}



@end
