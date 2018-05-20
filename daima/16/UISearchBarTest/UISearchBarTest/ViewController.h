//
//  ViewController.h
//  UISearchBarTest
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,
	UITableViewDelegate , UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;
@end

