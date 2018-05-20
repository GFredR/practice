//
//  ViewController.swift
//  SMDatePicker


import UIKit

class ViewController: UIViewController, SMDatePickerDelegate {
    
    private var yPosition: CGFloat = 50.0
    private var activePicker: SMDatePicker?
    
    private var picker: SMDatePicker = SMDatePicker()
    private var button: UIButton = ViewController.cusomButton("Default picker")
    
    private var pickerColor: SMDatePicker = SMDatePicker()
    private var buttonColor: UIButton = ViewController.cusomButton("Custom colors")
    
    private var pickerToolbar: SMDatePicker = SMDatePicker()
    private var buttonToolbar: UIButton = ViewController.cusomButton("Toolbar customization")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple().withAlphaComponent(0.8)
        
        button.addTarget(self, action: #selector(ViewController.button(_:)), for: UIControlEvents.touchUpInside)
        addButton(button)
        
        buttonColor.addTarget(self, action: #selector(ViewController.buttonColor(_:)), for: UIControlEvents.touchUpInside)
        addButton(buttonColor)
        
        buttonToolbar.addTarget(self, action: #selector(ViewController.buttonToolbar(_:)), for: UIControlEvents.touchUpInside)
        addButton(buttonToolbar)
    }
    
    private func addButton(_ button: UIButton) {
        button.sizeToFit()
        button.frame.size = CGSize(width: self.view.frame.size.width * 0.8, height: button.frame.height)
        
        let xPosition = (view.frame.size.width - button.frame.width) / 2
        button.frame.origin = CGPoint(x: xPosition, y: yPosition)
        
        view.addSubview(button)
        
        yPosition += button.frame.height * 1.3
    }
    
    class func cusomButton(_ title: String) -> UIButton {
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.setTitle(title, for: UIControlState())
        button.backgroundColor = UIColor.black().withAlphaComponent(0.4)
        button.layer.cornerRadius = 10
        
        return button
    }
    
    // MARK: Actions

    func button(_ sender: UIButton) {
        activePicker?.hidePicker(true)
        picker.showPickerInView(view, animated: true)
        picker.delegate = self
        
        activePicker = picker
    }
    
    func buttonColor(_ sender: UIButton) {
        activePicker?.hidePicker(true)
        
        pickerColor.toolbarBackgroundColor = UIColor.gray()
        pickerColor.pickerBackgroundColor = UIColor.lightGray()
        pickerColor.showPickerInView(view, animated: true)
        pickerColor.delegate = self
        
        activePicker = pickerColor
    }
    
    func buttonToolbar(_ sender: UIButton) {
        activePicker?.hidePicker(true)
        
        pickerToolbar.toolbarBackgroundColor = UIColor.gray()
        pickerToolbar.title = "Customized"
        pickerToolbar.titleFont = UIFont.systemFont(ofSize: 16)
        pickerToolbar.titleColor = UIColor.white()
        pickerToolbar.delegate = self
        
        let buttonOne = toolbarButton("One")
        let buttonTwo = toolbarButton("Two")
        let buttonThree = toolbarButton("Three")
        
        pickerToolbar.leftButtons = [ UIBarButtonItem(customView: buttonOne) ]
        pickerToolbar.rightButtons = [ UIBarButtonItem(customView: buttonTwo) , UIBarButtonItem(customView: buttonThree) ]
        
        pickerToolbar.showPickerInView(view, animated: true)
        
        activePicker = pickerToolbar
    }
    
    private func toolbarButton(_ title: String) -> UIButton {
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.setTitle(title, for: UIControlState())
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 32)
        button.backgroundColor = UIColor.red().withAlphaComponent(0.4)
        button.layer.cornerRadius = 5.0
        
        return button
    }
    
    // MARK: SMDatePickerDelegate
    
    func datePicker(_ picker: SMDatePicker, didPickDate date: Date) {
        if picker == self.picker {
            button.setTitle(date.description, for: UIControlState())
        } else if picker == self.pickerColor {
            buttonColor.setTitle(date.description, for: UIControlState())
        } else if picker == self.pickerToolbar {
            buttonToolbar.setTitle(date.description, for: UIControlState())
        }
    }
    
    func datePickerDidCancel(_ picker: SMDatePicker) {
        if picker == self.picker {
            button.setTitle("Default picker", for: UIControlState())
        } else if picker == self.pickerColor {
            buttonColor.setTitle("Custom colors", for: UIControlState())
        } else if picker == self.pickerToolbar {
            buttonToolbar.setTitle("Toolbar customization", for: UIControlState())
        }
    }

}

