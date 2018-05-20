//
//  UIViewControllerRestorationExtension.swift
//

import UIKit


// Protocol for view controllers that want to present restorable popovers
protocol PopoverRestorationDelegate : UIPopoverPresentationControllerDelegate {

    // The source view and rectangle that presents the popover
    func popoverSourceView() -> UIView?
    func popoverSourceRect() -> CGRect

    // Allowed arrow directions for the popover
    func popoverArrowDirection() -> UIPopoverArrowDirection
}


// Default implementations
extension PopoverRestorationDelegate {

    func popoverSourceRect() -> CGRect {
        return popoverSourceView()?.bounds ?? CGRect.zero
    }

    func popoverArrowDirection() -> UIPopoverArrowDirection {
        return .any
    }
}


// Key for encoding of popoverPresentationController's configuration
private let keySourceViewController = "popoverRestorationSourceViewController"


extension UIViewController {

    func encodePopoverState(with coder: NSCoder) {

        if let pc = presentingViewController as? PopoverRestorationDelegate {
            if (pc.popoverSourceView()) != nil {

                // Store a reference to the presenting view controller
                coder.encode(presentingViewController, forKey: keySourceViewController)
            }
        }
    }

    func decodePopoverState(with coder: NSCoder) {

        if let sourceViewController = coder.decodeObject(forKey: keySourceViewController) as? PopoverRestorationDelegate {
            if let sourceView = sourceViewController.popoverSourceView() {

                // Original style as from storyboard
                let originalModalPresentationStyle = modalPresentationStyle

                // Switch to popover-style and access presentationController to trigger creation of a UIPopoverPresentationController
                modalPresentationStyle = .popover

                if let pc = presentationController as? UIPopoverPresentationController {

                    // Restore configuration for popoverPresentationController
                    pc.delegate = sourceViewController
                    pc.sourceView = sourceView
                    pc.sourceRect = sourceViewController.popoverSourceRect()
                    pc.permittedArrowDirections = sourceViewController.popoverArrowDirection()

                    // Enforce layout to place sourceView at correct location
                    if let svc = sourceViewController as? UIViewController {
                        svc.view.layoutIfNeeded()
                    }
                }

                // Revert to original style
                modalPresentationStyle = originalModalPresentationStyle
            }
        }
    }
}
