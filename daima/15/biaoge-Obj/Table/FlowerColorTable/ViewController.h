

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *redFlowers;
@property (nonatomic, strong) NSArray *blueFlowers;

@end
