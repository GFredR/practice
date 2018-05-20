//
//  ViewController.swift


import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: AnyObject) {
        
        let audioPath = Bundle.main().pathForResource("beethoven-2-1-1-pfaul", ofType: "mp3")!
        
        var error : NSError? = nil
        
        do {
            player = try AVAudioPlayer(contentsOf: URL(string: audioPath)!)
        } catch let error1 as NSError {
            error = error1
        }
        
        if error == nil {
            
            player.play()
            
        } else {
            
            print(error)
        }
        
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        
        player.pause()
    }
    
    @IBAction func sliderChanged(_ sender: AnyObject) {
    
    // both player and slider defaults are between 0 and 1
        
    player.volume = sliderValue.value
    
    
    }
    
    @IBOutlet var sliderValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

