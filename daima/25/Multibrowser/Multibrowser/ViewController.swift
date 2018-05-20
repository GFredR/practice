//
//  ViewController.swift


import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    // MARK: - Stored Properties
    
    weak var activeWebView: UIWebView?

    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var addressBar: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Methods Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDefaultTitle()
        
        let addWebViewBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.addWebView))
        let deleteWebViewBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(ViewController.deleteWebView))
        self.navigationItem.rightBarButtonItems = [addWebViewBarButtonItem, deleteWebViewBarButtonItem]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.stackView.axis = self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact ? .vertical : .horizontal

    }

    // MARK: - Delegate Methods
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let webView = self.activeWebView, address = self.addressBar.text!.hasPrefix("https://") ? self.addressBar.text : "https://\(self.addressBar.text!)"  else { return false }
        guard let url = URL(string: address) else { return false }
        webView.loadRequest(URLRequest(url: url))
        
        textField.resignFirstResponder()
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if webView == self.activeWebView { self.updateUIUsingWebView(webView) }
    }

    // MARK: - Local Methods
    
    func addWebView() {
        let webView = UIWebView()
        webView.delegate = self
        
        self.stackView.addArrangedSubview(webView)
        
        let url = URL(string: "https://www.apple.com")!
        webView.loadRequest(URLRequest(url: url))
        
        webView.layer.borderColor = UIColor.blue().cgColor
        self.selectWebView(webView)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(ViewController.webViewTapped(_:)))
        tapGR.delegate = self
    }
    
    func deleteWebView() {
        guard let currentWebView = self.activeWebView else { return }
        guard let index = self.stackView.arrangedSubviews.index(of: currentWebView) else { return }
        // found the current view & remove it from the stack view
        self.stackView.removeArrangedSubview(currentWebView)
        // & remove it from the view hierarchy
        currentWebView.removeFromSuperview()
        
        if self.stackView.arrangedSubviews.count == 0 {
            self.setDefaultTitle()
        }
        else {
            // convert index value to an int
            var currentIndex = Int(index)
            // if that was the last web view in the stack, go back one
            if currentIndex == self.stackView.arrangedSubviews.count {
                currentIndex = self.stackView.arrangedSubviews.count - 1
            }
            // find the web view at the new index and select it
            if let newSelectedWebView = self.stackView.arrangedSubviews[currentIndex] as? UIWebView {
                self.selectWebView(newSelectedWebView)
            }
        }
    }
    
    func updateUIUsingWebView(_ webView: UIWebView) {
        self.title = webView.stringByEvaluatingJavaScript(from: "document.title")
        self.addressBar.text = webView.request?.url?.absoluteString ?? ""
        
    }
    
    func selectWebView(_ webView: UIWebView) {
        for view in self.stackView.arrangedSubviews {
            view.layer.borderWidth = 0
        }
        
        self.activeWebView = webView
        webView.layer.borderWidth = 3
        
        self.updateUIUsingWebView(webView)
    }
    
    func setDefaultTitle() {
        self.title = "Multibrowser"
    }
    
    func webViewTapped(_ recognizer: UITapGestureRecognizer) {
        if let selectedWebView = recognizer.view as? UIWebView {
            self.selectWebView(selectedWebView)
        }
    }
}

