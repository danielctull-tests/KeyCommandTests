
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

	// MARK: Key Commands

	// Lets have the app delegate become the first responder and go through all 
	// the view controllers and combine all their key commands. We need to make 
	// a note of which key commands belong to which view controller so we can
	// provide the view controller in targetForAction(:withSender:) later on.
	// The sender in that case is the key command, so we can just store a
	// dictionary of key commands to view controllers.

	var targets: [UIKeyCommand : UIViewController] = [:]
	override var keyCommands: [UIKeyCommand]? {

		guard let rootViewController = window?.rootViewController else {
			return nil
		}

		var commands: [UIKeyCommand] = []
		var targets: [UIKeyCommand : UIViewController] = [:]

		rootViewController.recurseChildViewControllers { viewController in

			guard let viewControllerCommands = viewController.keyCommands else {
				return
			}

			for command in viewControllerCommands {
				commands.append(command)
				targets[command] = viewController
			}
		}

		self.targets = targets

		return commands
	}

	override func canBecomeFirstResponder() -> Bool {
		return true
	}

	override func targetForAction(action: Selector, withSender sender: AnyObject?) -> AnyObject? {

		guard let command = sender as? UIKeyCommand else {
			return nil
		}

		return targets[command]
	}
}
