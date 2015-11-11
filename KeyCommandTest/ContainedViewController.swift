
import UIKit

class ContainedViewController: UIViewController {

	override var keyCommands: [UIKeyCommand]? {
		return [UIKeyCommand(input: "e", modifierFlags: .Command, action: "action:", discoverabilityTitle: "Contained Action")]
	}

	func action(sender: UIKeyCommand) {
		let controller = UIAlertController(title: sender.discoverabilityTitle, message: "Actioned in \(self.classForCoder).", preferredStyle: .Alert)
		controller.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
		presentViewController(controller, animated: true, completion: nil)
	}
}
