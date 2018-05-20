//
//  IntentHandler.m


#import "IntentHandler.h"

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Start my workout using <myApp>"
// "Pause my workout using <myApp>"
// "Resume my workout using <myApp>"
// "Cancel my workout using <myApp>"
// "End my workout using <myApp>"


// Testing by Airfly
// -------------------------------------------
// A: Start my workout using Running
// B: Pause my workout using Running
// C: Resume my workout using Running
// D: Cancel my workout using Running
// E: End my workout using Running
//

@interface IntentHandler () <INStartWorkoutIntentHandling, INPauseWorkoutIntentHandling, INResumeWorkoutIntentHandling, INCancelWorkoutIntentHandling, INEndWorkoutIntentHandling>

@end

@implementation IntentHandler

//for debug
static int tracking = 0;

// call handlerForIntent()
// -------------------------------------------
//A-1
//A-3
//A-5
//A-7
//A-9
//A-11
//A-13
- (id)handlerForIntent:(INIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    
    NSLog(@"tracking = %i, handlerForIntent()",++tracking);
    
    
    /*/testing language
    NSString* language = [INPreferences siriLanguageCode];
    
    if ([language isEqualToString:@"en-US"])
        NSLog(@"The Siri language is U.S. English.");*/
    
    
    id handler = nil;
    
    // You can substitute other objects for self based on the specific intent.
    if ([intent isKindOfClass:[INStartWorkoutIntent class]] ||
        [intent isKindOfClass:[INPauseWorkoutIntent class]] ||
        [intent isKindOfClass:[INResumeWorkoutIntent class]] ||
        [intent isKindOfClass:[INCancelWorkoutIntent class]] ||
        [intent isKindOfClass:[INEndWorkoutIntent class]]) {
        handler = self;
    }
    
    return handler;
}

#pragma mark - INStartWorkoutIntentHandling

// Implement resolution methods to provide additional information about your intent (optional).

//A-10
- (void)resolveIsOpenEndedForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INBooleanResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveIsOpenEndedForStartWorkout()",++tracking);
    
    INBooleanResolutionResult *resolutionResult = [INBooleanResolutionResult successWithResolvedValue:NO];
    completion(resolutionResult);
}

//A-4
- (void)resolveGoalValueForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INDoubleResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveGoalValueForStartWorkout()",++tracking);
    
    INDoubleResolutionResult *resolutionResult = [INDoubleResolutionResult successWithResolvedValue:5];
    completion(resolutionResult);
}

//A-6
- (void)resolveWorkoutGoalUnitTypeForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INWorkoutGoalUnitTypeResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveWorkoutGoalUnitTypeForStartWorkout()",++tracking);
    
    INWorkoutGoalUnitTypeResolutionResult *resolutionResult = [INWorkoutGoalUnitTypeResolutionResult successWithResolvedValue:INWorkoutGoalUnitTypeMinute];
    completion(resolutionResult);
}

//A-8
- (void)resolveWorkoutLocationTypeForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INWorkoutLocationTypeResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveWorkoutLocationTypeForStartWorkout()",++tracking);
    
    INWorkoutLocationTypeResolutionResult *resolutionResult = [INWorkoutLocationTypeResolutionResult successWithResolvedValue:INWorkoutLocationTypeIndoor];
    completion(resolutionResult);
}

//A-2
//beta 2
- (void)resolveWorkoutNameForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INSpeakableStringResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveWorkoutNameForStartWorkout()",++tracking);
    
    // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
    INSpeakableString *resolvedWorkoutName = [[INSpeakableString alloc] initWithIdentifier:@"latissimus_dorsi_pulldown" spokenPhrase:@"Lat Pulldown"  pronunciationHint:@"lat pull down"];
    INSpeakableStringResolutionResult *resolutionResult = [INSpeakableStringResolutionResult successWithResolvedString:resolvedWorkoutName];
    completion(resolutionResult);
}

- (void)resolveWorkoutNameForPauseWorkout:(INPauseWorkoutIntent *)pauseWorkoutIntent withCompletion:(void (^)(INSpeakableStringResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveWorkoutNameForPauseWorkout()",++tracking);
    
    // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
    INSpeakableString *resolvedWorkoutName = [[INSpeakableString alloc] initWithIdentifier:@"latissimus_dorsi_pulldown" spokenPhrase:@"Lat Pulldown"  pronunciationHint:@"lat pull down"];
    INSpeakableStringResolutionResult *resolutionResult = [INSpeakableStringResolutionResult successWithResolvedString:resolvedWorkoutName];
    completion(resolutionResult);
}

- (void)resolveWorkoutNameForResumeWorkout:(INResumeWorkoutIntent *)resumeWorkoutIntent withCompletion:(void (^)(INSpeakableStringResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveWorkoutNameForResumeWorkout()",++tracking);
    
    // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
    INSpeakableString *resolvedWorkoutName = [[INSpeakableString alloc] initWithIdentifier:@"latissimus_dorsi_pulldown" spokenPhrase:@"Lat Pulldown"  pronunciationHint:@"lat pull down"];
    INSpeakableStringResolutionResult *resolutionResult = [INSpeakableStringResolutionResult successWithResolvedString:resolvedWorkoutName];
    completion(resolutionResult);
}

- (void)resolveWorkoutNameForCancelWorkout:(INCancelWorkoutIntent *)cancelWorkoutIntent withCompletion:(void (^)(INSpeakableStringResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveWorkoutNameForCancelWorkout()",++tracking);
    
    // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
    INSpeakableString *resolvedWorkoutName = [[INSpeakableString alloc] initWithIdentifier:@"latissimus_dorsi_pulldown" spokenPhrase:@"Lat Pulldown"  pronunciationHint:@"lat pull down"];
    INSpeakableStringResolutionResult *resolutionResult = [INSpeakableStringResolutionResult successWithResolvedString:resolvedWorkoutName];
    completion(resolutionResult);
}

- (void)resolveWorkoutNameForEndWorkout:(INEndWorkoutIntent *)endWorkoutIntent withCompletion:(void (^)(INSpeakableStringResolutionResult * _Nonnull))completion {
    
    NSLog(@"tracking = %i, resolveWorkoutNameForEndWorkout()",++tracking);
    
    // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
    INSpeakableString *resolvedWorkoutName = [[INSpeakableString alloc] initWithIdentifier:@"latissimus_dorsi_pulldown" spokenPhrase:@"Lat Pulldown"  pronunciationHint:@"lat pull down"];
    INSpeakableStringResolutionResult *resolutionResult = [INSpeakableStringResolutionResult successWithResolvedString:resolvedWorkoutName];
    completion(resolutionResult);
}

//A-12
// Once resolution is completed, perform validation on the intent and provide confirmation (optional).
//beta 2
- (void)confirmStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent completion:(void (^)(INStartWorkoutIntentResponse * _Nonnull))completion {
    
    NSLog(@"tracking = %i, confirmStartWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INStartWorkoutIntent class])];
    INStartWorkoutIntentResponse *response = [[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}

- (void)confirmPauseWorkout:(INPauseWorkoutIntent *)pauseWorkoutIntent completion:(void (^)(INPauseWorkoutIntentResponse * _Nonnull))completion {
    
    NSLog(@"tracking = %i, confirmPauseWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INPauseWorkoutIntent class])];
    INPauseWorkoutIntentResponse *response = [[INPauseWorkoutIntentResponse alloc] initWithCode:INPauseWorkoutIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}

- (void)confirmResumeWorkout:(INResumeWorkoutIntent *)resumeWorkoutIntent completion:(void (^)(INResumeWorkoutIntentResponse * _Nonnull))completion {
    
    NSLog(@"tracking = %i, confirmResumeWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INResumeWorkoutIntent class])];
    INResumeWorkoutIntentResponse *response = [[INResumeWorkoutIntentResponse alloc] initWithCode:INResumeWorkoutIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}

- (void)confirmCancelWorkout:(INCancelWorkoutIntent *)cancelWorkoutIntent completion:(void (^)(INCancelWorkoutIntentResponse * _Nonnull))completion {
    
    NSLog(@"tracking = %i, confirmCancelWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INCancelWorkoutIntent class])];
    INCancelWorkoutIntentResponse *response = [[INCancelWorkoutIntentResponse alloc] initWithCode:INCancelWorkoutIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}

- (void)confirmEndWorkout:(INEndWorkoutIntent *)endWorkoutIntent completion:(void (^)(INEndWorkoutIntentResponse * _Nonnull))completion {
    
    NSLog(@"tracking = %i, confirmEndWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INEndWorkoutIntent class])];
    INEndWorkoutIntentResponse *response = [[INEndWorkoutIntentResponse alloc] initWithCode:INEndWorkoutIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}

//A-14
// Handle the completed intent (required).
//beta 2
- (void)handleStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent completion:(void (^)(INStartWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to start a workout here.
    
    NSLog(@"tracking = %i, handleStartWorkout()",++tracking);
    
    // Update application state by updating NSUserActivity.
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INStartWorkoutIntent class])];
    INStartWorkoutIntentResponse *response = [[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

// Implement handlers for each intent you wish to handle.  As an example for workouts, you may wish to handle pause, resume, cancel, and end.

//B-4
#pragma mark - INPauseWorkoutIntentHandling
//beta 2
- (void)handlePauseWorkout:(INPauseWorkoutIntent *)pauseWorkoutIntent completion:(void (^)(INPauseWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to pause a workout here.
    
    NSLog(@"tracking = %i, handlePauseWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INPauseWorkoutIntent class])];
    INPauseWorkoutIntentResponse *response = [[INPauseWorkoutIntentResponse alloc] initWithCode:INPauseWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

//C-4
#pragma mark - INResumeWorkoutIntentHandling
//beta 2
- (void)handleResumeWorkout:(INResumeWorkoutIntent *)resumeWorkoutIntent completion:(void (^)(INResumeWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to resume a workout here.
    
    NSLog(@"tracking = %i, handleResumeWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INResumeWorkoutIntent class])];
    INResumeWorkoutIntentResponse *response = [[INResumeWorkoutIntentResponse alloc] initWithCode:INResumeWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

#pragma mark - INCancelWorkoutIntentHandling
//beta 2
- (void)handleCancelWorkout:(INCancelWorkoutIntent *)cancelWorkoutIntent completion:(void (^)(INCancelWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to cancel a workout here.
    
    NSLog(@"tracking = %i, handleCancelWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INCancelWorkoutIntent class])];
    INCancelWorkoutIntentResponse *response = [[INCancelWorkoutIntentResponse alloc] initWithCode:INCancelWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

//D-4
#pragma mark - INEndWorkoutIntentHandling
//beta 2
- (void)handleEndWorkout:(INEndWorkoutIntent *)endWorkoutIntent completion:(void (^)(INEndWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to end a workout here.
    
    NSLog(@"tracking = %i, handleEndWorkout()",++tracking);
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INEndWorkoutIntent class])];
    INEndWorkoutIntentResponse *response = [[INEndWorkoutIntentResponse alloc] initWithCode:INEndWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}
@end
