//
//  InterfaceController.m


#import "HomeInterfaceController.h"
#import "Event.h"
#import "OrdinaryEventRow.h"
#import "ImportantEventRow.h"


@interface HomeInterfaceController() {
    NSArray *_eventsData;
}

@end


@implementation HomeInterfaceController
@synthesize tableView;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self setupTable];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)setupTable
{
    _eventsData = [Event eventsList];
    
    NSMutableArray *rowTypesList = [NSMutableArray array];
    
    for (Event *event in _eventsData)
    {
        if (event.eventImageName.length > 0)
        {
            [rowTypesList addObject:@"ImportantEventRow"];
        }
        else
        {
            [rowTypesList addObject:@"OrdinaryEventRow"];
        }
    }
    
    [tableView setRowTypes:rowTypesList];
    
    for (NSInteger i = 0; i < tableView.numberOfRows; i++)
    {
        NSObject *row = [tableView rowControllerAtIndex:i];
        Event *event = _eventsData[i];
        
        if ([row isKindOfClass:[ImportantEventRow class]])
        {
            ImportantEventRow *importantRow = (ImportantEventRow *) row;
            [importantRow.eventImage setImage:[UIImage imageNamed:event.eventImageName]];
            [importantRow.titleLabel setText:event.eventTitle];
            [importantRow.timeLabel setText:event.eventTime];
        }
        else
        {
            OrdinaryEventRow *ordinaryRow = (OrdinaryEventRow *) row;
            [ordinaryRow.titleLabel setText:event.eventTitle];
            [ordinaryRow.timeLabel setText:event.eventTime];
        }
    }
}

@end



