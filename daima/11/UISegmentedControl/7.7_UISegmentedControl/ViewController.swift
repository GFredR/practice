//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var items=["选项1","选项2"] as [AnyObject]
        items.append(UIImage(named: "item03")!)
        let segmented=UISegmentedControl(items:items)
        segmented.center=self.view.center
        segmented.selectedSegmentIndex=1
        segmented.tintColor=UIColor.red()
        self.view.addSubview(segmented)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

