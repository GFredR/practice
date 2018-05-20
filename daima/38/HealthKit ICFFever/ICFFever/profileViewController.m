//
//  FirstViewController.m


#import "profileViewController.h"
#import "HKHealthStore+AAPLExtensions.h"

@interface profileViewController ()

@end

@implementation profileViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    if ([HKHealthStore isHealthDataAvailable])
    {
        NSSet *writeDataTypes = [self dataTypesToWrite];
        NSSet *readDataTypes = [self dataTypesToRead];
        
        [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
            if (!success)
            {
                NSLog(@"没有添加HealthKit授权，请检查权利和权限。: %@", error);
                
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // Update the user interface based on the current user's health information.
                [self updateAge];
                [self updateHeight];
                [self updateWeight];
            });
        }];
    }
}


// Returns the types of data that the app wants to write to HealthKit.
- (NSSet *)dataTypesToWrite
{
    HKQuantityType *heightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    HKQuantityType *weightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    HKQuantityType *tempType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];

    return [NSSet setWithObjects:tempType, heightType, weightType, nil];
}

// Returns the types of data that the app wants wishes to read from HealthKit.
- (NSSet *)dataTypesToRead
{
    HKQuantityType *heightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    HKQuantityType *weightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    HKQuantityType *tempType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];

    HKCharacteristicType *birthdayType = [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth];
    
    return [NSSet setWithObjects:heightType, weightType, birthdayType, tempType, nil];
}

#pragma mark - Reading HealthKit Data

- (void)updateAge
{
    NSError *error = nil;
    NSDate *dateOfBirth = [self.healthStore dateOfBirthWithError:&error];
    
    if (!dateOfBirth)
    {
        NSLog(@"没有发现年龄");
        dispatch_async(dispatch_get_main_queue(), ^{
        self.ageTextField.placeholder = @"输入年龄";
        });
    }
    
    else
    {
        NSDate *now = [NSDate date];
        NSDateComponents *ageComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:dateOfBirth toDate:now options:NSCalendarWrapComponents];
        NSUInteger usersAge = [ageComponents year];
        self.ageTextField.text = [NSNumberFormatter localizedStringFromNumber:@(usersAge) numberStyle:NSNumberFormatterNoStyle];
    }
}

- (void)updateHeight
{
    HKQuantityType *heightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    
    [self.healthStore aapl_mostRecentQuantitySampleOfType:heightType predicate:nil completion:^(HKQuantity *mostRecentQuantity, NSError *error)
    {
        if (!mostRecentQuantity)
        {
            NSLog(@"没有发现身高数据");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.heightTextField.placeholder = @"输入英寸";
            });
        }
        
        else
        {
            HKUnit *heightUnit = [HKUnit inchUnit];
            double usersHeight = [mostRecentQuantity doubleValueForUnit:heightUnit];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.heightTextField.text = [NSNumberFormatter localizedStringFromNumber:@(usersHeight) numberStyle:NSNumberFormatterNoStyle];
            });
        }
    }];
}

- (void)updateWeight
{
    HKQuantityType *weightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    
    [self.healthStore aapl_mostRecentQuantitySampleOfType:weightType predicate:nil completion:^(HKQuantity *mostRecentQuantity, NSError *error)
    {
        if (!mostRecentQuantity)
        {
            NSLog(@"没有发现体重数据");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.weightTextField.placeholder = @"输入镑";
            });
        }
        else
        {
            HKUnit *weightUnit = [HKUnit poundUnit];
            double usersWeight = [mostRecentQuantity doubleValueForUnit:weightUnit];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.weightTextField.text = [NSNumberFormatter localizedStringFromNumber:@(usersWeight) numberStyle:NSNumberFormatterNoStyle];
            });
        }
    }];
}

#pragma mark - Writing HealthKit Data

- (void)saveHeightIntoHealthStore:(double)height
{
    HKUnit *inchUnit = [HKUnit inchUnit];
    HKQuantity *heightQuantity = [HKQuantity quantityWithUnit:inchUnit doubleValue:height];
    
    HKQuantityType *heightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *heightSample = [HKQuantitySample quantitySampleWithType:heightType quantity:heightQuantity startDate:now endDate:now];
    
    [self.healthStore saveObject:heightSample withCompletion:^(BOOL success, NSError *error)
    {
        if (!success)
        {
            NSLog(@"保存身高错误 (%@): %@.", heightSample, error);
        }
        
        [self updateHeight];
    }];
}

- (void)saveWeightIntoHealthStore:(double)weight {
    HKUnit *poundUnit = [HKUnit poundUnit];
    HKQuantity *weightQuantity = [HKQuantity quantityWithUnit:poundUnit doubleValue:weight];
    
    HKQuantityType *weightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *weightSample = [HKQuantitySample quantitySampleWithType:weightType quantity:weightQuantity startDate:now endDate:now];
    
    [self.healthStore saveObject:weightSample withCompletion:^(BOOL success, NSError *error)
    {
        if (!success)
        {
           NSLog(@"保存体重错误 (%@): %@.", weightSample, error);
        }
        
        [self updateWeight];
    }];
}


#pragma mark - Convenience

- (NSNumberFormatter *)numberFormatter {
    static NSNumberFormatter *numberFormatter;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        numberFormatter = [[NSNumberFormatter alloc] init];
    });
    
    return numberFormatter;
}

#pragma mark - Actions


- (IBAction)save:(id)sender
{
    [self saveHeightIntoHealthStore:[self.heightTextField.text doubleValue]];
    [self saveWeightIntoHealthStore:[self.weightTextField.text doubleValue]];
    [self updateAge];
    
    [self.weightTextField resignFirstResponder];
    [self.heightTextField resignFirstResponder];
    
}
@end
