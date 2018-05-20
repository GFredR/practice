//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {

    @IBOutlet var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let currentDevice: UIDevice = UIDevice.current()
        var outputString: String = "这是一个 "
        
        if UIDevice.current().userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            outputString = outputString + "iPad "
        } else {
            outputString = outputString + "iPhone "
        }
        outputString = outputString + "(\(currentDevice.model))"
        
        outputLabel.text = outputString
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

