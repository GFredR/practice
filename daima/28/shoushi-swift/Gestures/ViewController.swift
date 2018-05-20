//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var originalRect: CGRect!
    
    @IBAction func foundTap(_ sender: AnyObject) {
        outputLabel.text="Tapped"
    }
    
    @IBAction func foundSwipe(_ sender: AnyObject) {
        outputLabel.text="Swiped"
    }
    
    @IBAction func foundPinch(_ sender: AnyObject) {
        var recognizer: UIPinchGestureRecognizer
        var feedback: String
        var scale: CGFloat
        
        recognizer=sender as! UIPinchGestureRecognizer
        scale=recognizer.scale
        imageView.transform = CGAffineTransform(rotationAngle: 0.0)
        
        feedback=String(format: "Pinched, Scale: %1.2f, Velocity: %1.2f",
            Float(recognizer.scale),Float(recognizer.velocity))
        outputLabel.text=feedback
        imageView.frame = CGRect(x: self.originalRect.origin.x,
            y: originalRect.origin.y,
            width: originalRect.size.width*scale,
            height: originalRect.size.height*scale);
    }
    
    @IBAction func foundRotation(_ sender: AnyObject) {
        var recognizer: UIRotationGestureRecognizer
        var feedback: String
        var rotation: CGFloat
        
        recognizer=sender as! UIRotationGestureRecognizer
        rotation=recognizer.rotation
        imageView.transform = CGAffineTransform(rotationAngle: 0.0)
        
        feedback=String(format: "Rotated, Radians: %1.2f, Velocity: %1.2f",
            Float(recognizer.rotation),Float(recognizer.velocity))
        outputLabel.text=feedback
        imageView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion==UIEventSubtype.motionShake {
            outputLabel.text="Shaking things up!"
            imageView.transform=CGAffineTransform.identity
            imageView.frame=originalRect
        }
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
        
        originalRect=imageView.frame;
        var tempImageView: UIImageView
        tempImageView=UIImageView(image:UIImage(named: "flower.png"))
        tempImageView.frame=originalRect
        view.addSubview(tempImageView)
        self.imageView=tempImageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

