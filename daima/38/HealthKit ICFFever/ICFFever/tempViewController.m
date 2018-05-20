//
//  SecondViewController.m


#import "tempViewController.h"
#import "HKHealthStore+AAPLExtensions.h"

@interface tempViewController ()

@end

@implementation tempViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([HKHealthStore isHealthDataAvailable])
    {
        NSSet *writeDataTypes = [self dataTypesToWrite];
        NSSet *readDataTypes = [self dataTypesToRead];
        
        [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
            if (!success)
            {
                NSLog(@"没有添加HealthKit授权，请检查权利和权限，错误: %@", error);
                
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // Update the user interface based on the current user's health information.

                [self updateTemp];
                
            });
        }];
    }
}


// Returns the types of data that Fit wishes to write to HealthKit.
- (NSSet *)dataTypesToWrite
{
    
    HKQuantityType *heightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    HKQuantityType *weightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    HKQuantityType *tempType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    
    return [NSSet setWithObjects:tempType, heightType, weightType, nil];
}

// Returns the types of data that Fit wishes to read from HealthKit.
- (NSSet *)dataTypesToRead
{
    HKQuantityType *heightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
    HKQuantityType *weightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    HKQuantityType *tempType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    
    HKCharacteristicType *birthdayType = [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth];
    
    return [NSSet setWithObjects:heightType, weightType, birthdayType, tempType, nil];
}

-(void)updateMostRecentTemp:(double)temp
{
    double adjustedTemp = 0;
    
    //F to Kelvin
    if([self.unitSegmentedController selectedSegmentIndex] == 0)
    {
        adjustedTemp = ((temp-32)/1.8)+273.15;
    }
    
    //C to Kelvin
    if([self.unitSegmentedController selectedSegmentIndex] == 1)
    {
        adjustedTemp = temp+273.15;
    }

    // Save the user's height into HealthKit.
    HKUnit *kelvinUnit = [HKUnit kelvinUnit];
    HKQuantity *tempQuainity = [HKQuantity quantityWithUnit:kelvinUnit doubleValue:adjustedTemp];
    
    HKQuantityType *tempType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    NSDate *now = [NSDate date];
    
    HKQuantitySample *tempSample = [HKQuantitySample quantitySampleWithType:tempType quantity:tempQuainity startDate:now endDate:now];
    
    [self.healthStore saveObject:tempSample withCompletion:^(BOOL success, NSError *error)
     {
         if (!success)
         {
             NSLog(@"保存温度错误(%@): %@.", tempSample, error);
         }
         
         [self updateTemp];
     }];
    
}

-(void)updateTemp
{
    HKQuantityType *recentTempType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    
    [self.healthStore aapl_mostRecentQuantitySampleOfType:recentTempType predicate:nil completion:^(HKQuantity *mostRecentQuantity, NSError *error)
     {
         if (!mostRecentQuantity)
         {
             NSLog(@"没有找到温度");
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 self.recentTempLabel.text = @"最近的温度：没有找到";
             });
         }
         else
         {
             HKUnit *kelvinUnit = [HKUnit kelvinUnit];
             double temp = [mostRecentQuantity doubleValueForUnit:kelvinUnit];
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 self.recentTempLabel.text = [NSString stringWithFormat:@"最近的温度: %0.2f", [self convertUnitsFromKelvin:temp]];
             });
         }
     }];

    
    [self.healthStore allQuantitySampleOfType:recentTempType predicate:nil completion:^(NSArray *results, NSError *error)
     {
         if (!results)
         {
             NSLog(@"没有找到温度");

         }
         
         else
         {
             HKUnit *kelvinUnit = [HKUnit kelvinUnit];
             
             double max = 0;
             double min = 1000;
             
             double sum  = 0;
             int numberOfSamples = 0;
             double averageTemp = 0;
             
             for(int x = 0; x < [results count]; x++)
             {
                 HKQuantitySample *sample = [results objectAtIndex: x];
                 
                 
                 if([[sample quantity] doubleValueForUnit:kelvinUnit] > max)
                 {
                     max = [[sample quantity] doubleValueForUnit:kelvinUnit];
                 }
                 
                 if([[sample quantity] doubleValueForUnit:kelvinUnit] < min)
                 {
                     min = [[sample quantity] doubleValueForUnit:kelvinUnit];
                 }
                 
                 if ([[sample startDate] timeIntervalSinceNow] < 604800.0) //7 days worth of seconds
                 {
                     
                     sum += [[sample quantity] doubleValueForUnit:kelvinUnit];
                     numberOfSamples++;
                 }
                 
             }
             
             averageTemp = sum/numberOfSamples;
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 self.highestTempLabel.text = [NSString stringWithFormat: @"最高温度: %0.2f", [self convertUnitsFromKelvin:max]];
                 self.lowestTempLabel.text = [NSString stringWithFormat: @"最低温度: %0.2f", [self convertUnitsFromKelvin:min]];
                 self.avgTempLabel.text = [NSString stringWithFormat: @"平均温度(7天): %0.2f", [self convertUnitsFromKelvin:averageTemp]];

             });
         }
     }];
}


-(double)convertUnitsFromKelvin:(double)kelvinUnits
{
    double adjustedTemp = 0;
    
    //Kelvin to F
    if([self.unitSegmentedController selectedSegmentIndex] == 0)
    {
        adjustedTemp = ((kelvinUnits-273.15)*1.8)+32;
    }
    
    //Kelvin to C
    if([self.unitSegmentedController selectedSegmentIndex] == 1)
    {
        adjustedTemp = kelvinUnits-273.15;
    }

    return adjustedTemp;
}

- (IBAction)save:(id)sender

{
    [self updateMostRecentTemp: [self.tempTextField.text doubleValue]];
    
    
}

- (IBAction)updateUnits:(id)sender
{
    [self updateTemp];
    
}


@end
