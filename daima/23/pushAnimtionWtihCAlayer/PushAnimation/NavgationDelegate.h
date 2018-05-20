//
//  NavgationDelegate.h


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NavgationDelegate : NSObject<UINavigationControllerDelegate>
{
    
}

@property (nonatomic,strong) UIPercentDrivenInteractiveTransition * interactionController;

@property (nonatomic,weak) UINavigationController  * navigationController;


//
//func navigationController(navigationController: UINavigationController,
//                          interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//    return self.interactionController
//}

@end
