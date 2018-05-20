//
//  ViewController.swift



import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let kRad2Deg:Double = 57.2957795
    
    @IBOutlet weak var toggleMotion: UISwitch!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var toggleAccelerometer: UISwitch!
    @IBOutlet weak var toggleGyroscope: UISwitch!
    @IBOutlet weak var rollOutput: UILabel!
    @IBOutlet weak var pitchOutput: UILabel!
    @IBOutlet weak var yawOutput: UILabel!
    
    var motionManager: CMMotionManager = CMMotionManager()
    
    @IBAction func controlHardware(_ sender: AnyObject) {
        if toggleMotion.isOn {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current()!, withHandler: {
                (motion: CMDeviceMotion?, error: NSError?) in
                self.doAttitude(motion!.attitude)
                if self.toggleAccelerometer.isOn {
                    self.doAcceleration(motion!.userAcceleration)
                }
                if self.toggleGyroscope.isOn {
                    self.doRotation(motion!.rotationRate)
                }
            })
        } else {
            toggleGyroscope.isOn=false
            toggleAccelerometer.isOn=false
            motionManager.stopDeviceMotionUpdates()
        }
    }
    
    func doAttitude(_ attitude: CMAttitude) {
        rollOutput.text=String(format:"%.0f",attitude.roll*kRad2Deg)
        pitchOutput.text=String(format:"%.0f",attitude.pitch*kRad2Deg)
        yawOutput.text=String(format:"%.0f",attitude.yaw*kRad2Deg)
        if !toggleGyroscope.isOn {
            colorView.alpha=CGFloat(fabs(attitude.pitch))
        }
    }
    
    func doAcceleration(_ acceleration: CMAcceleration) {
        if (acceleration.x > 1.3) {
            colorView.backgroundColor = UIColor.green()
        } else if (acceleration.x < -1.3) {
            colorView.backgroundColor = UIColor.orange()
        } else if (acceleration.y > 1.3) {
            colorView.backgroundColor = UIColor.red()
        } else if (acceleration.y < -1.3) {
            colorView.backgroundColor = UIColor.blue()
        } else if (acceleration.z > 1.3) {
            colorView.backgroundColor = UIColor.yellow()
        } else if (acceleration.z < -1.3) {
            colorView.backgroundColor = UIColor.purple()
        }
    }
    
    func doRotation(_ rotation: CMRotationRate) {
        var value: Double = fabs(rotation.x)+fabs(rotation.y)+fabs(rotation.z)/12.5;
        if (value > 1.0) { value = 1.0;}
        colorView.alpha = CGFloat(value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.deviceMotionUpdateInterval = 0.01
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

