//
//  MenuViewController.swift


import UIKit

class MenuViewController: UIViewController {
    
    var listItems = ["Red","Green","Blue"]
    var listViewController:[UIViewController] = []
    
    var baseVC:BaseViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        createListViewConroller()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createListViewConroller(){
        let redVC = storyboard?.instantiateViewController(withIdentifier: "RedNavigation")
        let greenVC = storyboard?.instantiateViewController(withIdentifier: "GreenNavigation")
        let blueVC = storyboard?.instantiateViewController(withIdentifier: "BlueNavigation")
        listViewController.append(redVC!)
        listViewController.append(greenVC!)
        listViewController.append(blueVC!)
    }
    
}

extension MenuViewController:UITableViewDelegate, UITableViewDataSource{
func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuCell
        cell.lblMenu.text = listItems[(indexPath as NSIndexPath).row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        baseVC!.contentVC = listViewController[(indexPath as NSIndexPath).row]
        baseVC?.leftMargin.constant = 0
    }
}

