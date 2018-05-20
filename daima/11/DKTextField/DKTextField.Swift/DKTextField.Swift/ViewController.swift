
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: DKTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchChanged(_ sender: AnyObject) {
        
        self.textField.isSecureTextEntry = (sender as! UISwitch).isOn
        
    }

}

