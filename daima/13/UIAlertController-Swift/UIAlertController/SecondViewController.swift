//
//  SecondViewController.swift
//  UIAlertController


import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func goToFirst(){
        let alertController: UIAlertController = UIAlertController(title: "Previous View",
            message: "Do you want to go to the previous view?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "No, cancel", style: .cancel){ action -> Void in
            //dont have to do anything
        }
        
        let nextAction = UIAlertAction(title: "Go", style: .default) { action -> Void in
            self.performSegue(withIdentifier: "toFirst", sender: self)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(nextAction)
        
        self.present(alertController, animated: true, completion: nil);
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

