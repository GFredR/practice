//
//  Employee.h


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Employee : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSSet *fkEmployeeToManagers;
@end

@interface Employee (CoreDataGeneratedAccessors)

- (void)addFkEmployeeToManagersObject:(NSManagedObject *)value;
- (void)removeFkEmployeeToManagersObject:(NSManagedObject *)value;
- (void)addFkEmployeeToManagers:(NSSet *)values;
- (void)removeFkEmployeeToManagers:(NSSet *)values;

@end
