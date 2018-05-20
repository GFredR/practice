//
//  PageViewController.h
//  UIPageControlTest


#import <UIKit/UIKit.h>

@interface PageController : UIViewController
// 代表界面上两个UILabel和一个UIImageView
@property (strong, nonatomic) UILabel* label;
@property (strong, nonatomic) UILabel* bookLabel;
@property (strong, nonatomic) UIImageView* bookImage;
- (id)initWithPageNumber:(NSInteger)pageNumber;
@end
