//
//  ViewController.swift
//  PickerView-swift
//
//  ViewController.swift
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var myUIPicker: UIPickerView = UIPickerView()
    
    // 表示する値の配列.
    var myValues: NSArray = ["周一","周二","周三","周四"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // サイズを指定する.
        myUIPicker.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width, height: 180.0)
        
        // Delegateを設定する.
        myUIPicker.delegate = self
        
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
    表示するデータ数を返す.
    */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    /*
    値を代入する.
    */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myValues[row] as? String
    }
    
    /*
    Pickerが選択された際に呼ばれる.
    */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(myValues[row])")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

