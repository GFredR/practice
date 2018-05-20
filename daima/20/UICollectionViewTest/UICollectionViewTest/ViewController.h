//
//  ViewController.h
//  UICollectionViewTest
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,
	UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *grid;

@end

