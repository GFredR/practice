//
//  StepCounterViewController.swift


import UIKit
import CoreMotion

class StepCounterViewController: UIViewController {

    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var cnt: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var floorsA: UILabel!
    @IBOutlet weak var floorsD: UILabel!
    
    var pedometer = CMPedometer()
    var startD: String!
    var endD: String!
    var isStart = false
    
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
            isStart = true
            sender.setTitle("Stop", for: UIControlState())
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "Y-M-d h:m:s"
            startD = formatter.string(from: currentDate)
            startDate.text = startD
            endDate.text = "----->"
            pedometer.startUpdates(from: currentDate){
                pedometerHandler in
                
                self.updateP(pedometerHandler.0!)
            }
        } else {
            isStart = false
            sender.setTitle("Start", for: UIControlState())
            
            pedometer.stopUpdates()
            if endDate.text != "0" {
                let currentDate = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "Y-M-d h:m:s"
                endD = formatter.string(from: currentDate)
                endDate.text = endD
            }
        }
        
    }
    
    func updateP(_ pedo:CMPedometerData) {
        
        print(pedo.numberOfSteps)
        cnt.text = "\(pedo.numberOfSteps)"
        
        print(String(format: "%.2f m", Float(pedo.distance!)))
        distance.text = String(format: "%.2f m", pedo.distance!)
        
        floorsA.text = "\(pedo.floorsAscended)"
        floorsD.text = "\(pedo.floorsDescended)"
        
    }

    @IBAction func reset(_ sender: UIButton) {
        startDate.text = "0"
        endDate.text = "0"
        cnt.text = "0"
        distance.text = "0"
        floorsA.text = "0"
        floorsD.text = "0"
    }
}
