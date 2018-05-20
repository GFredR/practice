//
//  ViewController.swift


import UIKit
import HealthKit

class ViewController: UIViewController {

    let healthStore = HKHealthStore()//实例对象
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //授权按钮
        let authorizeBtn = UIButton(type: UIButtonType.roundedRect)
        authorizeBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        authorizeBtn.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        authorizeBtn.backgroundColor = UIColor.cyan()
        authorizeBtn.setTitle("授权", for: UIControlState())
        authorizeBtn.addTarget(self, action: #selector(ViewController.authorizeBtnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(authorizeBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 授权按钮点击事件
    func authorizeBtnClick() {
        //判断当前设备是否支持HeathKit
        if HKHealthStore.isHealthDataAvailable() {
            //读取的数据
            let healthKitTypesToRead = NSSet(array:[
                HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,//步数
                HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!,//步行+跑步距离
                HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,//体重
                HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,//身高
                ])
            
            //请求
            healthStore.requestAuthorization(toShare: nil, read: healthKitTypesToRead as? Set<HKObjectType>, completion: { (result, error) -> Void in
                print(result, error)
            })
        }
    }


}

