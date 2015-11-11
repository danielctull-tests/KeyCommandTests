
import UIKit

class DetailViewController: UIViewController {

	override var keyCommands: [UIKeyCommand]? {
		return [UIKeyCommand(input: "d", modifierFlags: .Command, action: "action:", discoverabilityTitle: "Detail Action")]
	}

	func action(sender: UIKeyCommand) {
		let controller = UIAlertController(title: sender.discoverabilityTitle, message: "Actioned in \(self.classForCoder).", preferredStyle: .Alert)
		controller.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
		presentViewController(controller, animated: true, completion: nil)
	}
}
