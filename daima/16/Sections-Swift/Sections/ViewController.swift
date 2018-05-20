//
//  ViewController.swift


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let sectionsTableIdentifier = "SectionsTableIndentifier"
    var names: [String: [String]]!
    var keys: [String]!
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self,
            forCellReuseIdentifier: sectionsTableIdentifier)
        
        let path = Bundle.main().pathForResource(
                            "sortednames", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = (namesDict!.allKeys as! [String]).sorted()
        
        let resultsController = SearchResultsController()
        resultsController.names = names
        resultsController.keys = keys
        searchController =
            UISearchController(searchResultsController: resultsController)
        
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultsController
        
        tableView.sectionIndexBackgroundColor = UIColor.black()
        tableView.sectionIndexTrackingBackgroundColor = UIColor.darkGray()
        tableView.sectionIndexColor = UIColor.white()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table View Data Source Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView,
                numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(_ tableView: UITableView,
                titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView,
                cellForRowAt indexPath: IndexPath)
                    -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath)
        as UITableViewCell
        
        let key = keys[(indexPath as NSIndexPath).section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView)
                    -> [String]? {
        return keys
    }
}

