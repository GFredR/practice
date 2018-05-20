//
//  ViewController.swift
//  Button Fun


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.title(for: UIControlState())!
        let plainText = "\(title) 边的按钮被按下了"
        let styledText = NSMutableAttributedString(string: plainText)
        
        let attributes = [
            NSFontAttributeName:
                     UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)
        ]
        let nameRange = (plainText as NSString).range(of: title)
        styledText.setAttributes(attributes, range: nameRange)
        
        statusLabel.attributedText = styledText
    }
}

