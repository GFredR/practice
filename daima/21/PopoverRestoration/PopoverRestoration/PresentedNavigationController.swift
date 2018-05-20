import UIKit

class PresentedNavigationController: UINavigationController {

    override func encodeRestorableState(with coder: NSCoder) {

        // Call extension to store data for popover restoration
        encodePopoverState(with: coder)
        super.encodeRestorableState(with: coder)
    }

    override func decodeRestorableState(with coder: NSCoder) {

        // Call extension to restore data for popover restoration (must be done before call to super)
        decodePopoverState(with: coder)
        super.decodeRestorableState(with: coder)
    }

    // When the navigation controller appears, update its Done-button
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        if let presenter = self.presentingViewController {
            updateNavigationItemsForTraits(presenter.traitCollection)
        }
    }

    // Add or remove a Done-button as right navigation item
    func updateNavigationItemsForTraits(_ traits: UITraitCollection) {

        switch traits.horizontalSizeClass {

        case .regular:
             self.topViewController?.navigationItem.rightBarButtonItem = nil

        case .compact:
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PresentedNavigationController.dismissNavigationController(_:)))
            self.topViewController?.navigationItem.rightBarButtonItem = doneButton

        default:
            break
        }
    }

    // Handler for Done-button to dismiss the navigation controller
    func dismissNavigationController(_ sender: AnyObject?) {

        if let presenter = self.presentingViewController {
            presenter.dismiss(animated: true, completion: nil)
        }
    }
}

