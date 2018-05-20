//
//    IntentHandler.swift



import Intents

// As an example, this class is set up to handle the Ride intents.

// You can test your example integration by saying things to Siri like:
// "Request a ride using Batmobile"

class IntentHandler: INExtension, INRidesharingDomainHandling {
    
    override func handler(for intent: INIntent) -> AnyObject {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    // MARK: - INRequestRideIntentHandling
    
    func handle(requestRide intent: INRequestRideIntent, completion: (INRequestRideIntentResponse) -> Swift.Void) {
        let response = INRequestRideIntentResponse(code: .inProgress, userActivity: nil)
        completion(response)
    }
    
    // MARK: - INListRideOptionsIntentHandling
    
    func handle(listRideOptions intent: INListRideOptionsIntent, completion: (INListRideOptionsIntentResponse) -> Void) {
        let response = INListRideOptionsIntentResponse(code: .success, userActivity: nil)
        
        let pickupDate = Date(timeIntervalSinceNow: 240)
        let rideOption = INRideOption(name: "Batmobile LINE", estimatedPickupDate: pickupDate)
        
        rideOption.priceRange = INPriceRange(minimumPrice: 42.0, currencyCode: "USD")
        rideOption.disclaimerMessage = "This ride is cray cray."
        
        response.rideOptions = [rideOption]
        response.supportsApplePayForPayment = true
        
        completion(response)
    }
    
    // MARK: - INGetRideStatusIntentHandling
    
    func handle(getRideStatus intent: INGetRideStatusIntent, completion: (INGetRideStatusIntentResponse) -> Void) {
        let response = INGetRideStatusIntentResponse(code: .inProgress, userActivity: nil)
        completion(response)
    }
    
    func startSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent, to observer: INGetRideStatusIntentResponseObserver) {
        
    }
    
    
    func stopSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent) {
        
    }
}

