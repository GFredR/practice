//
//  AnimalChooserViewController.swift


import UIKit

class AnimalChooserViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let kComponentCount: Int = 2
    let kAnimalComponent: Int = 0
    let kSoundComponent: Int = 1
    
    var animalNames: [String] = []
    var animalSounds: [String] = []
    var animalImages: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        animalNames=["Mouse","Goose","Cat","Dog","Snake","Bear","Pig"]
        animalSounds=["Oink","Rawr","Ssss","Roof","Meow","Honk","Squeak"]
        animalImages=[
            UIImageView(image: UIImage(named: "mouse.png")),
            UIImageView(image: UIImage(named: "goose.png")),
            UIImageView(image: UIImage(named: "cat.png")),
            UIImageView(image: UIImage(named: "dog.png")),
            UIImageView(image: UIImage(named: "snake.png")),
            UIImageView(image: UIImage(named: "bear.png")),
            UIImageView(image: UIImage(named: "pig.png")),
        ]
        
        preferredContentSize = CGSize(width: 340,height: 380)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let initialView: ViewController =
        presentingViewController as! ViewController
        initialView.displayAnimal(animalNames[0],
            withSound: animalSounds[0], fromComponent: "nothing yet...")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (popoverPresentationController?.arrowDirection
            != UIPopoverArrowDirection.unknown) {
                
                // This view controller is running in a popover
                NSLog("I'm running in a Popover")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return kComponentCount
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==kAnimalComponent {
            return animalNames.count;
        } else {
            return animalSounds.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 55.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component==kAnimalComponent {
            return 75.0;
        } else {
            return 150.0;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if component==kAnimalComponent {
            let chosenImageView: UIImageView = animalImages[row]
            let workaroundImageView: UIImageView = UIImageView(frame: chosenImageView.frame)
            workaroundImageView.backgroundColor = UIColor(patternImage: chosenImageView.image!)
            return workaroundImageView
        } else {
            let soundLabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 100,height: 32))
            soundLabel.backgroundColor = UIColor.clear()
            soundLabel.text = animalSounds[row]
            return soundLabel
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let initialView: ViewController = presentingViewController as! ViewController
        
        if component==kAnimalComponent {
            let chosenSound: Int = pickerView.selectedRow(inComponent: kSoundComponent)
            initialView.displayAnimal(animalNames[row], withSound: animalSounds[chosenSound], fromComponent: "the Animal")
        } else {
            let chosenAnimal: Int = pickerView.selectedRow(inComponent: kAnimalComponent)
            initialView.displayAnimal(animalNames[chosenAnimal], withSound: animalSounds[row], fromComponent: "the Sound")
        }
    }
    
    @IBAction func dismissAnimalChooser(_ sender: AnyObject) {
        dismiss(animated: true , completion: nil)
    }



}
