//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorChoice: UISegmentedControl!
    @IBOutlet weak var flowerView: UIWebView!
    @IBOutlet weak var flowerDetailView: UIWebView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBAction func getFlower(_ sender: AnyObject?) {
        var imageURL: URL
        var detailURL: URL
        var imageURLString: String
        var detailURLString: String
        var color: String
        let sessionID: Int=Int( arc4random()%5 )
        
        color=colorChoice.titleForSegment(at: colorChoice.selectedSegmentIndex)!
        
        imageURLString =
            "https://teachyourselfios.info/?hour=9&color=\(color)&session=\(sessionID)"
        detailURLString =
            "https://teachyourselfios.info/?hour=9&session=\(sessionID)&type=detail"
        
        imageURL=URL(string: imageURLString)!
        detailURL=URL(string: detailURLString)!
        
        flowerView.loadRequest(URLRequest(url: imageURL))
        flowerDetailView.loadRequest(URLRequest(url: detailURL))
    }
    
    @IBAction func toggleFlowerDetail(_ sender: AnyObject) {
        flowerDetailView.isHidden = !(sender as! UISwitch).isOn
        blurView.isHidden = !(sender as! UISwitch).isOn
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        flowerDetailView.isHidden=true
        getFlower(nil)
        blurView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

