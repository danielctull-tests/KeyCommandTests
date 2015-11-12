
import UIKit

class KeyCommandController: UIResponder {

	let rootViewController: UIViewController
	init(rootViewController: UIViewController) {
		self.rootViewController = rootViewController
	}

	// Lets have this become the first responder and go through all
	// the view controllers and combine all their key commands. We need to make
	// a note of which key commands belong to which view controller so we can
	// provide the view controller in targetForAction(:withSender:) later on.
	// The sender in that case is the key command, so we can just store a
	// dictionary of key commands to view controllers.

	var targets: [UIKeyCommand : UIViewController] = [:]
	override var keyCommands: [UIKeyCommand]? {

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
