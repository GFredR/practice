//
//  ViewController.swift
//  SendMail


import UIKit
import MessageUI

class ViewController: UIViewController {

    @IBOutlet var contentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController {
    @IBAction func sendEmailTouched() {
        let mailComposer = configureMailComposer()
        if MFMailComposeViewController.canSendMail() {
            present(mailComposer, animated: true, completion: nil)
        } else {
            showError("Email Composer Error")
        }
    }
    
    @IBAction func sendMessageTouched() {
        let messageComposer = configureMessageComposer()
        if MFMessageComposeViewController.canSendText() {
            present(messageComposer, animated: true, completion: nil)
        } else {
            showError("Message Composer Error")
        }
    }
    
    private func configureMailComposer() -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["macbaszii@gmail.com"]) // Default Recipients (optional)
        mailComposer.setSubject("http://www.macbaszii.com") // Default Subject (optional)
        mailComposer.setMessageBody(contentField.text!, isHTML: false) // Default Message (optional)
        
        return mailComposer
    }
    
    private func configureMessageComposer() -> MFMessageComposeViewController {
        let messageComposer = MFMessageComposeViewController()
        messageComposer.messageComposeDelegate = self;
        messageComposer.body = contentField.text // Default Message (optional)
        messageComposer.recipients = ["11223344"] // Default Recipients (optional)
        
        return messageComposer
    }
    
    private func showError(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: NSError?) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
}

