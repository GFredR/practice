//
//  DetailViewController.swift
//  PinterestLayout
//


import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var currImage: UIImage?
    var textHeading: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Detail view controller")
        myLabel.text = textHeading
        myImageView.image = currImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
