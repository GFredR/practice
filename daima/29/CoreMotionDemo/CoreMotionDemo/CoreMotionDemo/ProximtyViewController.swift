//
//  ProximtyViewController.swift


import UIKit

class ProximtyViewController: UIViewController {

    var isStart = false
    @IBOutlet weak var bCnt: UILabel!
    var blinkCnt = 0
    var device = UIDevice.current()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default().addObserver(self, selector: #selector(ProximtyViewController.proximityDidChange(_:)), name: NSNotification.Name.UIDeviceProximityStateDidChange, object: nil)
        // Do any additional setup after loading the view.
        print(device.batteryLevel)
        print(device.batteryState)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func proximityDidChange(_ notification:NotificationCenter) {
        if device.proximityState {
            print("Close")
            blinkCnt += 1
        } else {
            print("Far")
            bCnt.text = "\(blinkCnt)"
        }
    }

    @IBAction func onSwitch(_ sender: UIButton) {
        
        if !isStart {
            sender.setTitle("Stop", for: UIControlState())
            isStart = true
            device.isProximityMonitoringEnabled = true
        } else {
            sender.setTitle("Start", for: UIControlState())
            isStart = false
            device.isProximityMonitoringEnabled = false
        }
        
        
        let state = device.proximityState
        print(state)
    }

    @IBAction func reset(_ sender: AnyObject) {
        blinkCnt = 0
        bCnt.text = "0"
    }

}
