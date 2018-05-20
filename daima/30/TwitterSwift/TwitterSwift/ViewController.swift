//
//  ViewController.swift
//  TwitterSwift

import UIKit

class ViewController: UITableViewController, TwitterEngineDelegate {

    lazy var theEngine = TwitterEngine.sharedEngine
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        theEngine.delegate = self
        theEngine.user = TwitterConsumer (key: "1ReC0vmXGc0HLyeHY7XijrT9k", secret: "iIonO9o2AZWrB6PPGdOKxhQxcrxvGCLFTykLOmBsTR2FyfFg2N")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refresh()
    }
    
    func tweet() {
        if self.theEngine.isAuthenticated() {

        }
        else {
    
        }
    }
    
    func login() {
       self.theEngine.authenticate {
            self.refresh()
        }
    }
    
    func refresh() {
        let selector = self.theEngine.isAuthenticated() ? #selector(ViewController.tweet) : #selector(ViewController.login)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem: UIBarButtonSystemItem.compose, target: self, action: selector)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem (barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: nil)
        self.title = self.theEngine.authenticatedUserName
        self.tableView.reloadData()
    }
    func controllerToPresentAuthenticationWebView() -> UIViewController {
        return self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as UITableViewCell
        cell.textLabel!.text = "Indexpath \((indexPath as NSIndexPath).row)"
        return cell
    }
}

