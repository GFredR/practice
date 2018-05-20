//
//  BaseViewController.swift


import UIKit

class BaseViewController: UIViewController {
    
    var menuVC:UIViewController!{
        didSet{
            view.layoutIfNeeded()
            menuView.addSubview(menuVC.view)
            
        }
    }
    
    var contentVC:UIViewController!{
        didSet{
            contentVC!.willMove(toParentViewController: contentVC)
            view.layoutIfNeeded()
            contentView.addSubview(contentVC.view)
        }
    }
    
    var originLeftMargin:CGFloat?
    
    @IBOutlet weak var leftMargin: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    
    @IBAction func onPanContentView(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        let transition = panGestureRecognizer.translation(in: self.view)
        let velocity = panGestureRecognizer.velocity(in: self.view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.began {
            originLeftMargin = leftMargin.constant
        } else if panGestureRecognizer.state == UIGestureRecognizerState.changed {
            leftMargin.constant = originLeftMargin! + transition.x
        } else if panGestureRecognizer.state == UIGestureRecognizerState.ended {
            if(velocity.x > 0){
                leftMargin.constant = UIScreen.main().bounds.width - 100
            }else{
                leftMargin.constant = 0
            }
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
