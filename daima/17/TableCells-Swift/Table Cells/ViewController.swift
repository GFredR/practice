//
//  ViewController.swift


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tableView:UITableView!
    let computers = [
        ["Name" : "AA", "Color" : "红色"],
        ["Name" : "BB", "Color" : "红色"],
        ["Name" : "CC", "Color" : "红色"],
        ["Name" : "DD", "Color" : "红色"],
        ["Name" : "EE", "Color" : "红色"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
        tableView.register(NameAndColorCell.self,
                 forCellReuseIdentifier: cellTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
                       -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath)
                      as! NameAndColorCell

        let rowData = computers[(indexPath as NSIndexPath).row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
        
        return cell
    }

}

