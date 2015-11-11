
import UIKit

extension UIViewController {

	func recurseChildViewControllers(block: UIViewController -> ()) {

		block(self)

		for child in childViewControllers {
			child.recurseChildViewControllers(block)
		}
	}
}

// For special view controllers, we only want to go through the
// on screen view controllers.

extension UINavigationController {

	override func recurseChildViewControllers(block: UIViewController -> ()) {
		block(self)
		topViewController?.recurseChildViewControllers(block)
	}
}

extension UITabBarController {

	override func recurseChildViewControllers(block: UIViewController -> ()) {
		block(self)
		selectedViewController?.recurseChildViewControllers(block)
	}
}

extension UISplitViewController {

	override func recurseChildViewControllers(block: UIViewController -> ()) {

		block(self)

		guard !collapsed || viewControllers.count == 2 else {
			super.recurseChildViewControllers(block)
			return
		}

		switch displayMode {

			case .AllVisible:
				super.recurseChildViewControllers(block)

			case .PrimaryHidden:
				viewControllers[1].recurseChildViewControllers(block)

			case .PrimaryOverlay:
				viewControllers[0].recurseChildViewControllers(block)

			// Never going to happen
			case .Automatic: break
		}
	}
}
