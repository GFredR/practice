//
//  ViewController.swift
//  NavigationController


import UIKit

class ViewController: UIViewController {
    var navController: UINavigationController?
    let rootViewController = RootViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navController = UINavigationController(rootViewController: rootViewController)
        self.view.addSubview(navController!.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

