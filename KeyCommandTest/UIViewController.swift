
import UIKit

extension UIViewController {

	func recurseChildViewControllers(block: UIViewController -> ()) {

		block(self)

		for child in childViewControllers {
			child.recurseChildViewControllers(block)
		}
	}
}
