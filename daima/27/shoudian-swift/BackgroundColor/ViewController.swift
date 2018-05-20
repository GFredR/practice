//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var hueSlider: UISlider!
    
    let kOnOffToggle="onOff"
    let kHueSetting="hue"
    
    @IBAction func setBackgroundHueValue(_ sender: AnyObject?) {
        
        let userDefaults: UserDefaults = UserDefaults.standard()
        
        userDefaults.set(toggleSwitch.isOn, forKey: kOnOffToggle)
        userDefaults.set(hueSlider.value, forKey: kHueSetting)
        userDefaults.synchronize()
        
        if toggleSwitch.isOn {
            view.backgroundColor=UIColor(hue: CGFloat(hueSlider.value),
                saturation: 0.75, brightness: 0.75, alpha: 1.0)
        } else {
            view.backgroundColor=UIColor.white()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults: UserDefaults = UserDefaults.standard()
        hueSlider.value=userDefaults.float(forKey: kHueSetting)
        toggleSwitch.isOn=userDefaults.bool(forKey: kOnOffToggle)
        
        setBackgroundHueValue(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

