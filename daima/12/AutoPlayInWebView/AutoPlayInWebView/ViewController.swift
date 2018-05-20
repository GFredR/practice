//
//  ViewController.swift
//  AutoPlayInWebView


import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    var _prefix:String = "autoplaytest://"
    
    @IBOutlet weak var wv: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let _path:String = Bundle.main().pathForResource("index", ofType: "html", inDirectory: "sound")!
        wv.loadRequest(URLRequest(url: URL(string: _path)!))
        
        wv.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let _urlstr:String = request.url?.absoluteString{
            if(_urlstr.hasPrefix(_prefix)){
                let _param = _urlstr.replacingOccurrences(of: _prefix, with: "")
                wv.stringByEvaluatingJavaScript(from: "playAudioFn('" + _param + "')")
                
                return Bool(false)
            }
        }
        return Bool(true)
    }

}

