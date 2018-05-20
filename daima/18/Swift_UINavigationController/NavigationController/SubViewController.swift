//
//  SubViewController.swift


import UIKit

class SubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red()
        let label = UILabel(frame: CGRect(x: 10, y: 200, width: 200, height: 40))
        label.text = "I am 老管"
        self.title = "无敌的"
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
