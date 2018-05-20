//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bunnyView1: UIImageView!
    @IBOutlet weak var bunnyView2: UIImageView!
    @IBOutlet weak var bunnyView3: UIImageView!
    @IBOutlet weak var bunnyView4: UIImageView!
    @IBOutlet weak var bunnyView5: UIImageView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var hopsPerSecond: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    @IBAction func toggleAnimation(_ sender: AnyObject) {
        if (bunnyView1.isAnimating()) {
            bunnyView1.stopAnimating()
            bunnyView2.stopAnimating()
            bunnyView3.stopAnimating()
            bunnyView4.stopAnimating()
            bunnyView5.stopAnimating()
            toggleButton.setTitle("Hop!", for: UIControlState())
        } else {
            bunnyView1.startAnimating()
            bunnyView2.startAnimating()
            bunnyView3.startAnimating()
            bunnyView4.startAnimating()
            bunnyView5.startAnimating()
            toggleButton.setTitle("Sit Still!", for: UIControlState())
        }
    }
    
    @IBAction func setSpeed(_ sender: AnyObject?) {
        bunnyView1.animationDuration=TimeInterval(2.0-speedSlider.value)
        bunnyView2.animationDuration =
            bunnyView1.animationDuration+TimeInterval(arc4random_uniform(10))/10
        bunnyView3.animationDuration =
            bunnyView1.animationDuration+TimeInterval(arc4random_uniform(10))/10
        bunnyView4.animationDuration =
            bunnyView1.animationDuration+TimeInterval(arc4random_uniform(10))/10
        bunnyView5.animationDuration =
            bunnyView1.animationDuration+TimeInterval(arc4random_uniform(10))/10
        
        bunnyView1.startAnimating()
        bunnyView2.startAnimating()
        bunnyView3.startAnimating()
        bunnyView4.startAnimating()
        bunnyView5.startAnimating()
        
        toggleButton.setTitle("Sit Still!", for: UIControlState())
        
        let hopRateString=String(format: "%1.2f hps", 1/(2-self.speedSlider.value))
        hopsPerSecond.text=hopRateString
    }
    
    @IBAction func incrementSpeed(_ sender: AnyObject) {
        speedSlider.value=Float(speedStepper.value)
        setSpeed(nil)
        
        
        let transformSlider : CGAffineTransform =
            CGAffineTransform(rotationAngle: -(CGFloat(M_PI_2)))
        speedSlider.transform = transformSlider
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let hopAnimation: [UIImage] = [
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!
        ]
        bunnyView1.animationImages=hopAnimation
        bunnyView2.animationImages=hopAnimation
        bunnyView3.animationImages=hopAnimation
        bunnyView4.animationImages=hopAnimation
        bunnyView5.animationImages=hopAnimation
        bunnyView1.animationDuration=1.0
        bunnyView2.animationDuration=1.0
        bunnyView3.animationDuration=1.0
        bunnyView4.animationDuration=1.0
        bunnyView5.animationDuration=1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }


}

