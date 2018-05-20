import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {

        return true
    }

    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {

        // Restore when version of saved state matches that of bundle version
        if let stateVersion = coder.decodeObject(forKey: UIApplicationStateRestorationBundleVersionKey)?.integerValue {
            if let bundleVersion = Bundle.main().infoDictionary? [kCFBundleVersionKey as String]?.integerValue {

                return stateVersion == bundleVersion
            }
        }

        return false
    }
}
