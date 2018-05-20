//
//  ViewController.swift
//  Swift-UILabel-Example


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 定义UILabel变量
        let myLabel: UILabel = UILabel()
        // 绘制文本
        myLabel.frame = CGRect(x: 0,y: 0,width: 300,height: 100)
        
        // 位置
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        
        // 背景色
        myLabel.backgroundColor = UIColor.red()
        
        // 文字
        myLabel.text = "Hello!!"
        
        // 设置文本颜色
        myLabel.font = UIFont.systemFont(ofSize: 40)
        
        // 文字色
        myLabel.textColor = UIColor.white()
        
        // 文字阴影色
        myLabel.shadowColor = UIColor.blue()
        
        // 文字居中对齐
        myLabel.textAlignment = NSTextAlignment.center
        
        // 初始值
        myLabel.layer.masksToBounds = true
        
        // 设置半径
        myLabel.layer.cornerRadius = 20.0
        
        // View追加显示
        self.view.addSubview(myLabel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
