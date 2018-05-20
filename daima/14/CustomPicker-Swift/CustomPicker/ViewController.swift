//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAnimal(_ chosenAnimal: String, withSound chosenSound:String, fromComponent chosenComponent: String) {
        outputLabel.text = "You changed \(chosenComponent) (\(chosenAnimal) and the sound \(chosenSound))"
    }


}

