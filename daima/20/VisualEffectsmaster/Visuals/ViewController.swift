//
//  ViewController.swift
//  Visuals

import UIKit

class ViewController: UIViewController {

    let animationDuration = 0.5
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var extraLightBlurView: UIVisualEffectView!
    @IBOutlet var lightBlurView: UIVisualEffectView!
    @IBOutlet var darkBlurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func extraLightSwitchChanged(_ sender: UISwitch) {
        UIView .animate(withDuration: self.animationDuration, animations: { () -> Void in
            self.extraLightBlurView.alpha = sender.isOn ? 1.0:0.0
        })
    }
    
    @IBAction func lightSwitchChanged(_ sender: UISwitch) {
        UIView .animate(withDuration: self.animationDuration, animations: { () -> Void in
            self.lightBlurView.alpha = sender.isOn ? 1.0:0.0
        })
    }
    
    @IBAction func darkSwitchChanged(_ sender: UISwitch) {
        UIView .animate(withDuration: self.animationDuration, animations: { () -> Void in
            self.darkBlurView.alpha = sender.isOn ? 1.0:0.0
        })
    }
    
}

