//
//  APLViewController.swift
//  Touches


import UIKit
import QuartzCore

@objc(APLViewController)
class APLViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // Views the user can move.
    @IBOutlet private weak var firstPieceView: UIImageView!
    @IBOutlet private weak var secondPieceView: UIImageView!
    @IBOutlet private weak var thirdPieceView: UIImageView!
    
    private weak var pieceForReset: UIView?
    
    
    //MARK: - Utility methods
    
    /**
    Scale and rotation transforms are applied relative to the layer's anchor point this method moves a gesture recognizer's view's anchor point between the user's fingers.
    */
    private func adjustAnchorPointForGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let piece = gestureRecognizer.view!
            let locationInView = gestureRecognizer.location(in: piece)
            let locationInSuperview = gestureRecognizer.location(in: piece.superview)
            
            piece.layer.anchorPoint = CGPoint(x: locationInView.x / piece.bounds.size.width, y: locationInView.y / piece.bounds.size.height)
            piece.center = locationInSuperview
        }
    }
    
    
    /**
    Display a menu with a single item to allow the piece's transform to be reset.
    */
    @IBAction private func showResetMenu(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            
            self.becomeFirstResponder()
            self.pieceForReset = gestureRecognizer.view
            
            /*
            Set up the reset menu.
            */
            let menuItemTitle = NSLocalizedString("Reset", comment: "Reset menu item title")
            let resetMenuItem = UIMenuItem(title: menuItemTitle, action: #selector(APLViewController.resetPiece(_:)))
            
            let menuController = UIMenuController.shared()
            menuController.menuItems = [resetMenuItem]
            
            let location = gestureRecognizer.location(in: gestureRecognizer.view)
            let menuLocation = CGRect(x: location.x, y: location.y, width: 0, height: 0)
            menuController.setTargetRect(menuLocation, in: gestureRecognizer.view!)
            
            menuController.setMenuVisible(true, animated: true)
        }
    }
    
    
    /**
    Animate back to the default anchor point and transform.
    */
    func resetPiece(_ controller: UIMenuController) {
        let pieceForReset = self.pieceForReset!
        
        let centerPoint = CGPoint(x: pieceForReset.bounds.midX, y: pieceForReset.bounds.midY)
        let locationInSuperview = pieceForReset.convert(centerPoint, to: pieceForReset.superview)
        
        pieceForReset.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pieceForReset.center = locationInSuperview
        
        UIView.beginAnimations(nil, context: nil)
        pieceForReset.transform = CGAffineTransform.identity
        UIView.commitAnimations()
    }
    
    
    // UIMenuController requires that we can become first responder or it won't display
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    
    //MARK: - Touch handling
    
    /**
    Shift the piece's center by the pan amount.
    Reset the gesture recognizer's translation to {0, 0} after applying so the next callback is a delta from the current position.
    */
    @IBAction private func panPiece(_ gestureRecognizer: UIPanGestureRecognizer) {
        let piece = gestureRecognizer.view!
        
        self.adjustAnchorPointForGestureRecognizer(gestureRecognizer)
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: piece.superview!)
            
            piece.center = CGPoint(x: piece.center.x + translation.x, y: piece.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: piece.superview)
        }
    }
    
    
    /**
    Rotate the piece by the current rotation.
    Reset the gesture recognizer's rotation to 0 after applying so the next callback is a delta from the current rotation.
    */
    @IBAction private func rotatePiece(_ gestureRecognizer: UIRotationGestureRecognizer) {
        self.adjustAnchorPointForGestureRecognizer(gestureRecognizer)
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view!.transform = gestureRecognizer.view!.transform.rotate(gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
    
    
    /**
    Scale the piece by the current scale.
    Reset the gesture recognizer's rotation to 0 after applying so the next callback is a delta from the current scale.
    */
    @IBAction private func scalePiece(_ gestureRecognizer: UIPinchGestureRecognizer) {
        self.adjustAnchorPointForGestureRecognizer(gestureRecognizer)
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view!.transform = gestureRecognizer.view!.transform.scaleBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
            gestureRecognizer.scale = 1
        }
    }
    
    
    /**
    Ensure that the pinch, pan and rotate gesture recognizers on a particular view can all recognize simultaneously.
    Prevent other gesture recognizers from recognizing simultaneously.
    */
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // If the gesture recognizers's view isn't one of our pieces, don't allow simultaneous recognition.
        if gestureRecognizer.view !== self.firstPieceView && gestureRecognizer.view !== self.secondPieceView && gestureRecognizer.view != self.thirdPieceView {
            return false
        }
        
        // If the gesture recognizers are on different views, don't allow simultaneous recognition.
        if gestureRecognizer.view !== otherGestureRecognizer {
            return false
        }
        
        // If either of the gesture recognizers is the long press, don't allow simultaneous recognition.
        if gestureRecognizer is UILongPressGestureRecognizer || otherGestureRecognizer is UILongPressGestureRecognizer {
            return false
        }
        
        return true
    }
    
    
}
