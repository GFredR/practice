//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userOutput: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    
    @IBAction func setOutput(_ sender: AnyObject) {
        userOutput.text=userInput.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

