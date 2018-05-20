//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup(){
        let redLayer = CALayer()
        
        redLayer.frame = CGRect(x: 50, y: 50, width: 300, height: 50)
        redLayer.backgroundColor = UIColor.red().cgColor
        
        // Round corners
        redLayer.cornerRadius = 15
        
        // Set Border
        redLayer.borderColor = UIColor.black().cgColor
        redLayer.borderWidth = 2.5
        
        // Set shadow
        redLayer.shadowColor = UIColor.black().cgColor
        redLayer.shadowOpacity = 0.8
        redLayer.shadowOffset = CGSize(width: 5, height: 5)
        redLayer.shadowRadius = 3
        
        self.view.layer.addSublayer(redLayer)
        
        let imageLayer = CALayer()
        let image = UIImage(named: "ButterflySmall.jpg")!
        imageLayer.contents = image.cgImage
        
        imageLayer.frame = CGRect(x: 50, y: 150, width: image.size.width, height: image.size.height)
        imageLayer.contentsGravity = kCAGravityResizeAspect
        imageLayer.contentsScale = UIScreen.main().scale
        
        imageLayer.shadowColor = UIColor.black().cgColor
        imageLayer.shadowOpacity = 0.8
        imageLayer.shadowOffset = CGSize(width: 5, height: 5)
        imageLayer.shadowRadius = 3
        
        self.view.layer.addSublayer(imageLayer)
        
        // Create a blank animation using the keyPath "cornerRadius", the property we want to animate
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        
        // Set the starting value
        animation.fromValue = redLayer.cornerRadius
        
        // Set the completion value
        animation.toValue = 0
        
        // How many times should the animation repeat
        animation.repeatCount = 10
        
        // Finally, add the animation to the layer
        redLayer.add(animation, forKey: "cornerRadius")
    }

}

