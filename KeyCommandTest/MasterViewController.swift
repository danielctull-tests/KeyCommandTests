
import UIKit

class MasterViewController: UIViewController {

	override var keyCommands: [UIKeyCommand]? {
		return [UIKeyCommand(input: "m", modifierFlags: .Command, action: "action:", discoverabilityTitle: "Master Action")]
	}

	override func canBecomeFirstResponder() -> Bool {
		return true
	}

	func action(sender: UIKeyCommand) {
		let controller = UIAlertController(title: sender.discoverabilityTitle, message: "Actioned in \(self.classForCoder).", preferredStyle: .Alert)
		controller.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
		presentViewController(controller, animated: true, completion: nil)
	}
}
