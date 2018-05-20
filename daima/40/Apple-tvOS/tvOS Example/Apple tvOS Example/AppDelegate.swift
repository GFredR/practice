//
//  AppDelegate.swift


import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    var appController: TVApplicationController?
    static let TVBaseUrl = "http://www.toppr.net/web/web/1/"
    static let TVBootUrl = "\(AppDelegate.TVBaseUrl)js/application.js"
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main().bounds)
        
        let appControllerContext = TVApplicationControllerContext()
        
        if let javaScriptURL = URL(string: AppDelegate.TVBootUrl) {
            appControllerContext.javaScriptApplicationURL = javaScriptURL
        }
        
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseUrl
        
        if let launchOptions = launchOptions as? [String: AnyObject] {
            for (kind, value) in launchOptions {
                appControllerContext.launchOptions[kind] = value
            }
        }
        
        self.appController = TVApplicationController(context: appControllerContext, window: self.window, delegate: self)
        
        return true
    }
}

