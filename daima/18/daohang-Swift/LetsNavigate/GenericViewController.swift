//
//  GenericViewController.swift


import UIKit

class GenericViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    
    @IBAction func incrementCount(_ sender: AnyObject) {
        (parent as! CountingNavigationController).pushCount += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let displayCount=(parent as! CountingNavigationController).pushCount
        countLabel.text=String(displayCount)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
