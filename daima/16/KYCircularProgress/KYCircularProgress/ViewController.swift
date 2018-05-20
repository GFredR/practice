//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {

    var circularProgress1: KYCircularProgress!
    var circularProgress2: KYCircularProgress!
    var circularProgress3: KYCircularProgress!
    var progress: UInt8 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupKYCircularProgress1()
        setupKYCircularProgress2()
        setupKYCircularProgress3()
        
        Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(ViewController.updateProgress), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupKYCircularProgress1() {
        circularProgress1 = KYCircularProgress(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2))
        let center = (CGFloat(160.0), CGFloat(200.0))
        circularProgress1.path = UIBezierPath(arcCenter: CGPoint(x: center.0, y: center.1), radius: CGFloat(circularProgress1.frame.size.width/3.0), startAngle: CGFloat(M_PI), endAngle: CGFloat(0.0), clockwise: true)
        circularProgress1.lineWidth = 8.0
        
        let textLabel = UILabel(frame: CGRect(x: circularProgress1.frame.origin.x + 120.0, y: 170.0, width: 80.0, height: 32.0))
        textLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 32)
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor.green()
        textLabel.alpha = 0.3
        self.view.addSubview(textLabel)
        
        circularProgress1.progressChangedClosure({ (progress: Double, circularView: KYCircularProgress) in
            print("progress: \(progress)")
            textLabel.text = "\(Int(progress * 100.0))%"
        })
        
        self.view.addSubview(circularProgress1)
    }
    
    func setupKYCircularProgress2() {
        circularProgress2 = KYCircularProgress(frame: CGRect(x: 0, y: circularProgress1.frame.size.height, width: self.view.frame.size.width/2, height: self.view.frame.size.height/3))
        circularProgress2.colors = [0xA6E39D, 0xAEC1E3, 0xAEC1E3, 0xF3C0AB]
        
        self.view.addSubview(circularProgress2)
    }
    
    func setupKYCircularProgress3() {
        circularProgress3 = KYCircularProgress(frame: CGRect(x: circularProgress2.frame.size.width*1.25, y: circularProgress1.frame.size.height*1.15, width: self.view.frame.size.width/2, height: self.view.frame.size.height/2))
        circularProgress3.colors = [0xFFF77A, 0xF3C0AB]
        circularProgress3.lineWidth = 3.0
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50.0, y: 2.0))
        path.addLine(to: CGPoint(x: 84.0, y: 86.0))
        path.addLine(to: CGPoint(x: 6.0, y: 33.0))
        path.addLine(to: CGPoint(x: 96.0, y: 33.0))
        path.addLine(to: CGPoint(x: 17.0, y: 86.0))
        path.close()
        circularProgress3.path = path
        
        self.view.addSubview(circularProgress3)
    }
    
    func updateProgress() {
        progress = progress &+ 1
        let normalizedProgress = Double(progress) / 255.0
        
        circularProgress1.progress = normalizedProgress
        circularProgress2.progress = normalizedProgress
        circularProgress3.progress = normalizedProgress
    }
}
