//
//  ViewController.h
//  UICollectionViewTest
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,
	UICollectionViewDelegate , UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *grid;

@end

