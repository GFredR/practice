//
//  ViewController.swift


import UIKit
import AudioToolbox // Needed Vibrate the iPhone


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func vib1(_ sender: AnyObject) {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate)) // Plays a vibrate, but plays a sound instead if your device does not support vibration
    }

    
    @IBAction func vib2(_ sender: AnyObject) {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate)) // Plays vibrate only
    }
    
}

