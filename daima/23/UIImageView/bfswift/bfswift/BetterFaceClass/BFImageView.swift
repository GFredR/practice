//
//  BFImageView.swift
//  bfswift

import Foundation
import UIKit
import QuartzCore

let BETTER_LAYER_NAME = "BETTER_LAYER_NAME"
let GOLDEN_RATIO = 0.618

class BFImageView: UIImageView {
    var needsBetterFace: Bool = false
    
    var fast: Bool = true
    
    var detector: CIDetector?
    
    override var image: UIImage! {
    get {
        return super.image
    }
    set {
        super.image = newValue
        if self.needsBetterFace {
            self.faceDetect(newValue)
        }
    }
    }
    
    func faceDetect(_ aImage: UIImage){
        let queue: DispatchQueue = DispatchQueue(label: "com.croath.betterface.queue", attributes: DispatchQueueAttributes.concurrent)
        queue.async(execute: {
                var image = aImage.ciImage
                if image == nil {
                    image = CIImage(cgImage: aImage.cgImage!)
                }
                
                if self.detector == nil {
                    let opts = [(self.fast ? CIDetectorAccuracyLow : CIDetectorAccuracyHigh): CIDetectorAccuracy]
                    self.detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: opts)
                }
                
                let features: [AnyObject] = self.detector!.features(in: image!)
                
                if features.count == 0 {
                    print("no faces")
                    DispatchQueue.main.async(execute: {
                            self.imageLayer().removeFromSuperlayer()
                        })
                } else {
                    print("succeed \(features.count) faces")
                    let imgSize = CGSize(width: Double((aImage.cgImage?.width)!), height: (Double((aImage.cgImage?.height)!)))
                    self.markAfterFaceDetect(features, size: imgSize)
                }
            })
    }
    
    func markAfterFaceDetect(_ features: [AnyObject], size: CGSize) {
        var fixedRect = CGRect(x: Double(MAXFLOAT), y: Double(MAXFLOAT), width: 0, height: 0)
        var rightBorder:Double = 0, bottomBorder: Double = 0
        for f: AnyObject in features {
            var oneRect = CGRect(x: f.bounds.origin.x, y: f.bounds.origin.y, width: f.bounds.size.width, height: f.bounds.size.height)
            oneRect.origin.y = size.height - oneRect.origin.y - oneRect.size.height
            
            fixedRect.origin.x = min(oneRect.origin.x, fixedRect.origin.x)
            fixedRect.origin.y = min(oneRect.origin.y, fixedRect.origin.y)
            
            rightBorder = max(Double(oneRect.origin.x) + Double(oneRect.size.width), rightBorder)
            bottomBorder = max(Double(oneRect.origin.y) + Double(oneRect.size.height), bottomBorder)
        }
        
        fixedRect.size.width = CGFloat(Int(rightBorder) - Int(fixedRect.origin.x))
        fixedRect.size.height = CGFloat(Int(bottomBorder) - Int(fixedRect.origin.y))
        
        var fixedCenter: CGPoint = CGPoint(x: fixedRect.origin.x + fixedRect.size.width / 2.0,
            y: fixedRect.origin.y + fixedRect.size.height / 2.0)
        var offset: CGPoint = CGPoint.zero
        var finalSize: CGSize = size
        if size.width / size.height > self.bounds.size.width / self.bounds.size.height {
            //move horizonal
            finalSize.height = self.bounds.size.height
            finalSize.width = size.width/size.height * finalSize.height
            fixedCenter.x = finalSize.width / size.width * fixedCenter.x
            fixedCenter.y = finalSize.width / size.width * fixedCenter.y
            
            offset.x = fixedCenter.x - self.bounds.size.width * 0.5
            if (offset.x < 0) {
                offset.x = 0
            } else if (offset.x + self.bounds.size.width > finalSize.width) {
                offset.x = finalSize.width - self.bounds.size.width
            }
            offset.x = -offset.x
        } else {
            //move vertical
            finalSize.width = self.bounds.size.width
            finalSize.height = size.height/size.width * finalSize.width
            fixedCenter.x = finalSize.width / size.width * fixedCenter.x
            fixedCenter.y = finalSize.width / size.width * fixedCenter.y
            
            offset.y = CGFloat(fixedCenter.y - self.bounds.size.height * CGFloat(1-GOLDEN_RATIO))
            if (offset.y < 0) {
                offset.y = 0
            } else if (offset.y + self.bounds.size.height > finalSize.height){
                finalSize.height = self.bounds.size.height
                offset.y = finalSize.height
            }
            offset.y = -offset.y
        }
        
        DispatchQueue.main.async(execute: {
                let layer: CALayer = self.imageLayer()
                layer.frame = CGRect(x: offset.x, y: offset.y, width: finalSize.width, height: finalSize.height)
                layer.contents = self.image.cgImage
            })
    }
    
    func imageLayer() -> CALayer {
        if let sublayers = self.layer.sublayers {
            for layer: AnyObject in sublayers {
                if layer.name == BETTER_LAYER_NAME {
                    return layer as! CALayer
                }
            }
        }
        
        let layer = CALayer()
        layer.name = BETTER_LAYER_NAME
        layer.actions =
            [
                "contents": NSNull(),
                "bounds": NSNull(),
                "position": NSNull()
        ]
        self.layer.addSublayer(layer)
        return layer
    }
}
