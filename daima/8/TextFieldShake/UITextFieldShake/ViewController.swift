//
//  ViewController.swift
//  UITextFieldShake


import UIKit

class ViewController: UIViewController {
  
  var textField: UITextField?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    textField = UITextField(frame: CGRect(x: 10, y: 20, width: 200, height: 30))
    textField!.borderStyle = UITextBorderStyle.roundedRect
    textField!.placeholder = "我是文本框"
    textField!.center = self.view.center
    self.view.addSubview(textField!)
    
    let button: UIButton = UIButton(type: UIButtonType.system) 
    button.frame = CGRect(x: 20, y: 64, width: 100, height: 44)
    button.setTitle("Shake", for: UIControlState())
    button.addTarget(self, action: #selector(ViewController._startShake(_:)), for: UIControlEvents.touchUpInside)
    self.view.addSubview(button)
    
  }
  
  // MARK: - 执行振动
  func _startShake(_ sender: UIButton) {
    self.textField?.wy_shakeWith(completionHandle: {() -> () in
      print("我是回调啊")
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

