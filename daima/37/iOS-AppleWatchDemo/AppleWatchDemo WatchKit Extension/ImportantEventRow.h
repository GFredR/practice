//
//  ImportantEventRow.h


#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface ImportantEventRow : NSObject

@property(nonatomic, weak) IBOutlet WKInterfaceLabel *titleLabel;
@property(nonatomic, weak) IBOutlet WKInterfaceLabel *timeLabel;
@property(nonatomic, weak) IBOutlet WKInterfaceImage *eventImage;

@end
