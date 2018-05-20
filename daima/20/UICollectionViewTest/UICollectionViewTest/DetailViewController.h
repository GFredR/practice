//
//  DetailViewController.h
//  UICollectionViewTest


#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *bookCover;
@property (strong, nonatomic) IBOutlet UITextView *bookDetail;
// 用于接受上一个控制器传入参数的属性
@property (strong, nonatomic) NSString* imageName;
@property (nonatomic, assign) NSInteger bookNo;
@end
