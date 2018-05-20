//
//  UITextField+WYShake.swift
//  UITextFieldShake
//
//  Created by WuYikai on 15/6/27.
//  Copyright (c) 2015年 secoo. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
  enum WYShakeDirection {
    case horizontal
    case vertical
  }

  func wy_shakeWith( _ times: Int = 10, delta: CGFloat = 5, speed: TimeInterval = 0.03, shakeDirection: WYShakeDirection = .horizontal, completionHandle: (() -> ())? = nil) {
    let direction: CGFloat = (times % 2 == 0) ? 1 : -1
    UIView.animate(withDuration: speed, animations: { () -> Void in
      self.transform = (shakeDirection == WYShakeDirection.horizontal) ?
        CGAffineTransform(translationX: delta * direction, y: 0) :
        CGAffineTransform(translationX: 0, y: delta * direction)
    }) { (finished) -> Void in
      if times <= 0 {
        UIView.animate(withDuration: speed, animations: { () -> Void in
          self.transform = CGAffineTransform.identity
        }, completion: { (finished) -> Void in
          if let handle = completionHandle {
            handle()
          }
        })
        return
      }
      
      self.wy_shakeWith(times - 1, delta: delta, speed: speed, shakeDirection: shakeDirection, completionHandle: completionHandle)
    }
  }
  
}
