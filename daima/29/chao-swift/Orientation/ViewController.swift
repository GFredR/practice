//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orientationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIDevice.current().beginGeneratingDeviceOrientationNotifications()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.orientationChanged(_:)), name: "UIDeviceOrientationDidChangeNotification" as NSNotification.Name, object: nil)
    }
    
    func orientationChanged(_ notification: Notification) {
        
        let orientation:UIDeviceOrientation = UIDevice.current().orientation
        
        switch (orientation) {
        case UIDeviceOrientation.faceUp:
            orientationLabel.text="Face Up"
        case UIDeviceOrientation.faceDown:
            orientationLabel.text="Face Down"
        case UIDeviceOrientation.portrait:
            orientationLabel.text="Standing Up"
        case UIDeviceOrientation.portraitUpsideDown:
            orientationLabel.text="Upside Down"
        case UIDeviceOrientation.landscapeLeft:
            orientationLabel.text="Left Side"
        case UIDeviceOrientation.landscapeRight:
            orientationLabel.text="Right Side"
        default:
            orientationLabel.text="Unknown"
        }
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

