//


import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        if (textView.text == "") {
            textViewDidEndEditing(textView)
        }
        let tapDismiss = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tapDismiss)
    }
    
    func dismissKeyboard(){
        textView.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray()
        }
        textView.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        if (textView.text == "Placeholder"){
            textView.text = ""
            textView.textColor = UIColor.black()
        }
        textView.becomeFirstResponder()
    }

}

