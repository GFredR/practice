//
//  RootViewController.swift
//  NavigationController


import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 10, y: 200, width: 200, height: 40))
        label.text = "I am 老管"
        self.title = "无敌的"
        self.view.addSubview(label)
        
        let btn: UIButton = UIButton(type:.system) as UIButton
        btn.frame = CGRect(x: 10, y: 240, width: 200, height: 40)
        btn.setTitle("按下我", for: UIControlState())
        btn.addTarget(self, action: "buttonPressed", for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    
    func buttonPressed() {
        let subView = SubViewController()
        self.navigationController?.pushViewController(subView, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
