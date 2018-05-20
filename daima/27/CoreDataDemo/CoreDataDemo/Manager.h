//
//  Manager.h


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Employee;

@interface Manager : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSSet *fkManagerToEmployees;
@end

@interface Manager (CoreDataGeneratedAccessors)

- (void)addFkManagerToEmployeesObject:(Employee *)value;
- (void)removeFkManagerToEmployeesObject:(Employee *)value;
- (void)addFkManagerToEmployees:(NSSet *)values;
- (void)removeFkManagerToEmployees:(NSSet *)values;

@end
