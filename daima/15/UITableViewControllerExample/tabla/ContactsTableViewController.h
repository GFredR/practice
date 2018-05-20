//
//  TablaViewController.h
//  tabla
//


#import <UIKit/UIKit.h>

@interface ContactsTableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray *contacts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
