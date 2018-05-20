//
//  InterfaceController.m


#import "InterfaceController.h"
#import "rowcontroller.h"

@interface InterfaceController()

@end


@implementation InterfaceController
NSMutableArray *watchData;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    
    watchData = [[NSMutableArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five",@"Six",@"Seven",@"Eight",@"Nine",@"Ten", nil];
    
    [_watchTable setNumberOfRows:[watchData count] withRowType:@"rowID"];
    
    for (int i = 0; i < [watchData count]; i++) {
        
        NSString *getData = [watchData objectAtIndex:i];
        
        rowcontroller *nextVC = [_watchTable rowControllerAtIndex:i];
        
        [nextVC.detailLabel setText:getData];
        
    }
    
    
    
}

-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex{
    
    
    if ([segueIdentifier isEqualToString:@"boom"]) {
        
        return watchData[rowIndex];
        
    }
    
    return nil;
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



