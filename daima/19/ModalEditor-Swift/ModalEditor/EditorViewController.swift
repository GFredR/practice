//
//  EditorViewController.swift


import UIKit

class EditorViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func updateEditor(_ sender: AnyObject) {
        (presentingViewController as! ViewController).emailLabel.text=emailField.text
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
        emailField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        preferredContentSize = CGSize(width: 340,height: 160)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailField.text=(presentingViewController as! ViewController).emailLabel.text
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
