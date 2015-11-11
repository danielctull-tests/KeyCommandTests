
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		guard let splitViewController = self.window?.rootViewController as? UISplitViewController else {
			return true
		}

		splitViewController.preferredDisplayMode = .AllVisible
		return true
	}
}

