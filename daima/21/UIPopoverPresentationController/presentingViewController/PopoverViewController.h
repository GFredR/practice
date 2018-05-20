//
//  Popover.h
//  presentingViewController

#import <UIKit/UIKit.h>

@interface PopoverViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *colorArray;

@end
