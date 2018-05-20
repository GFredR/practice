//
//  OrdinaryEventRow.h


#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface OrdinaryEventRow : NSObject

@property (nonatomic, weak) IBOutlet WKInterfaceLabel *titleLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *timeLabel;

@end
