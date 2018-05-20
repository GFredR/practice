//
//  SearchResultsController.h


#import <UIKit/UIKit.h>

@interface SearchResultsController : UITableViewController <UISearchResultsUpdating>

- (instancetype)initWithNames:(NSDictionary *)names keys:(NSArray *)keys;

@end
