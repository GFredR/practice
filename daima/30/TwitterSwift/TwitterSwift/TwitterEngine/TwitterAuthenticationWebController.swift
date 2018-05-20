//
//  TwitterAuthenticationWebController.swift
//  TwitterSwift


import Foundation
import UIKit

class TwitterAuthenticationWebController : UIViewController, UIWebViewDelegate {
    var webView : UIWebView?
    var requestToken : Token?
    let newPinJS = "var d = document.getElementById('oauth-pin'); if (d == null) d = document.getElementById('oauth_pin'); if (d) { var d2 = d.getElementsByTagName('code'); if (d2.length > 0) d2[0].innerHTML; }"
    
    let oldPinJS = "var d = document.getElementById('oauth-pin'); if (d == null) d = document.getElementById('oauth_pin'); if (d) d = d.innerHTML; d;"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    init (requestToken : Token) {
        super.init(nibName: nil, bundle: nil)
        let screenRect = UIScreen.main().bounds
        self.webView = UIWebView (frame: screenRect)
        self.webView?.delegate = self
        self.requestToken = requestToken
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.webView!);
        self.navigationItem.leftBarButtonItem = UIBarButtonItem (barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(TwitterAuthenticationWebController.dismiss as (TwitterAuthenticationWebController) -> () -> ()))
        if let oauth_token = self.requestToken?.key {
            let urlString = "https://api.twitter.com/oauth/authorize?oauth_token=\(oauth_token)"
            let request = NSMutableURLRequest (url: URL(string: urlString)!)
            self.webView?.loadRequest(request as URLRequest)
        }
    }
    
    func dismiss () {
        self.dismiss(animated: true, completion: nil)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        var pin : String? = webView.stringByEvaluatingJavaScript(from: self.newPinJS)?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if pin?.utf16.count < 7 {
            pin = webView.stringByEvaluatingJavaScript(from: self.oldPinJS)?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        
        if pin?.utf16.count > 0 {
            self.requestToken?.verifier = pin!
            TwitterEngine.sharedEngine.requestAccessToken(self.requestToken!)
            self.dismiss()
        }
    }
}
