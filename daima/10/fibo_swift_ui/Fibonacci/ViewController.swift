

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theSlider: UISlider!
    
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var selectedValueLabel: UILabel!
    var fibo: FibonacciModel = FibonacciModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addASlider() {
    }

    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
    
        
    //func sliderValueDidChange () {
        
        var returnedArray: [Int] = []
        var formattedOutput:String = ""
        
        //Display the updated slider value
        self.selectedValueLabel!.text = String(Int(theSlider!.value))
        
        //Calculate the Fibonacci elements based on the new slider value
        returnedArray = self.fibo.calculateFibonacciNumbers(minimum2: Int(theSlider!.value))
        
        //Put the elements in a nicely formatted array
        for number in returnedArray {
            
            formattedOutput = formattedOutput + String(number) + ", "
        }
        
        //Update the textfield with the formatted array
        self.outputTextView!.text = formattedOutput
    }
    
    
}
