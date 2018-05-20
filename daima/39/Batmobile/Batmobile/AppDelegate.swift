//
//    AppDelegate.swift


import UIKit
import Intents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        INPreferences.requestSiriAuthorization { status in
            if status != .authorized {
                fatalError("Why would you do that? :(")
            }
        }
        
        return true
    }
}

