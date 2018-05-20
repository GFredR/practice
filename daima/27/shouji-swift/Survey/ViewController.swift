//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsView: UITextView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBAction func storeSurvey(_ sender: AnyObject) {
        let csvLine:String="\(firstName.text!),\(lastName.text!),\(email.text!)\n"
        let paths = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0]
        let surveyFile:String=(docDir as NSString).appendingPathComponent("surveyresults.csv")
        
        if !FileManager.default().fileExists(atPath: surveyFile) {
            FileManager.default().createFile(atPath: surveyFile,
                contents: nil, attributes: nil)
        }
        
        let fileHandle:FileHandle=FileHandle(forUpdatingAtPath:surveyFile)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
        fileHandle.closeFile()
        
        firstName.text=""
        lastName.text=""
        email.text=""
        
    }
    
    @IBAction func showResults(_ sender: AnyObject) {
        let paths = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0] as String
        let surveyFile:String=(docDir as NSString).appendingPathComponent("surveyresults.csv")
        
        if FileManager.default().fileExists(atPath: surveyFile) {
            let fileHandle:FileHandle=FileHandle(forReadingAtPath:surveyFile)!
            let surveyResults:String=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            resultsView.text=surveyResults
        }
    }
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        email.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

