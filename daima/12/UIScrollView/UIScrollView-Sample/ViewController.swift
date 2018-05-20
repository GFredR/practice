//
//  ViewController.swift

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //UIImageに画像の名前を指定します
        let img1 = UIImage(named:"img1.jpg");
        let img2 = UIImage(named:"img2.jpg");
        let img3 = UIImage(named:"img3.jpg");
        
        //UIImageViewにUIIimageを追加
        let imageView1 = UIImageView(image:img1)
        let imageView2 = UIImageView(image:img2)
        let imageView3 = UIImageView(image:img3)
        
        //UIScrollViewを作成します
        let scrView = UIScrollView()
        
        //表示位置 + 1ページ分のサイズ
        scrView.frame = CGRect(x: 50, y: 50, width: 240, height: 240)
        
        //全体のサイズ
        scrView.contentSize = CGSize(width: 240*3, height: 240)
        
        //UIImageViewのサイズと位置を決めます
        //左右に並べる
        imageView1.frame = CGRect(x: 0, y: 0, width: 240, height: 240)
        imageView2.frame = CGRect(x: 240, y: 0, width: 240, height: 240)
        imageView3.frame = CGRect(x: 480, y: 0, width: 240, height: 240)
        
        
        //viewに追加します
        self.view.addSubview(scrView)
        scrView.addSubview(imageView1)
        scrView.addSubview(imageView2)
        scrView.addSubview(imageView3)
        
        // １ページ単位でスクロールさせる
        scrView.isPagingEnabled = true
        
        //scroll画面の初期位置
        scrView.contentOffset = CGPoint(x: 0, y: 0);
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

