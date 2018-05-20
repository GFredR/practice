//
//  AltitudeViewController.swift


import UIKit
import CoreMotion
import CoreGraphics
import QuartzCore


class AltitudeViewController: UIViewController {

    var altimeter = CMAltimeter()
    var isStart = false
    
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var altitudeMax: UILabel!
    @IBOutlet weak var pressure: UILabel!



    var aMax:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSwitch(_ sender: UIButton) {
        
        if !isStart {
            sender.setTitle("Stop", for: UIControlState())
            isStart = true
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.current()!) {
                altiData, error in
                
                self.updateA(altiData!.relativeAltitude)
                self.updateP(altiData!.pressure)

            }
        } else {
            sender.setTitle("Start", for: UIControlState())
            isStart = false
            altimeter.stopRelativeAltitudeUpdates()
        }
        
    }
    
    func updateA(_ alti:NSNumber) {
        altitude.text = String(format: "%.2f m", alti.floatValue)
        if fabs(alti.floatValue) > aMax {
            aMax = fabs(alti.floatValue)
            altitudeMax.text = String(format: "%.2f m", aMax)
        }
        
    }
    
    func updateP(_ pres:NSNumber) {
        
        pressure.text = String(format: "%.2f KPa", pres.floatValue)
    }
    
    @IBAction func reset(_ sender: AnyObject) {
        

        aMax = 0
        
        altitude.text = "0"
        altitudeMax.text = "0"
        pressure.text = "0"
        
    }
}
