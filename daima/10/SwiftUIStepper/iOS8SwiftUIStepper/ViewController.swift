//
//  ViewController.swift
//  iOS8SwiftUIStepper
//
//  Created by Kenneth Wilcox on 1/2/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var valueLabel: UILabel!
  @IBOutlet weak var stepper: UIStepper!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    stepper.wraps = true
    stepper.autorepeat = true
    stepper.maximumValue = 10
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    valueLabel.text = Int(sender.value).description
  }
}

