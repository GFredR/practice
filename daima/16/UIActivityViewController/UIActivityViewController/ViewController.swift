//
//  ViewController.swift
//  UIActivityViewController


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UIActivityViewController Setup
    @IBAction func shareSheet(_ sender: AnyObject){
        
        let firstActivityItem = "Hey, check out this mediocre site that sometimes posts about Swift!"
        let urlString = "http://www.dvdowns.com/"
        let secondActivityItem : URL = URL(string:urlString)!
        
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypePrint,
            UIActivityTypeAssignToContact,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToVimeo,
            UIActivityTypePostToTencentWeibo
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }

}

