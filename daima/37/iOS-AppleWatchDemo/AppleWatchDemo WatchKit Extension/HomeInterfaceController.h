//
//  InterfaceController.h


#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface HomeInterfaceController : WKInterfaceController

@property(nonatomic, weak) IBOutlet WKInterfaceTable *tableView;

@end
