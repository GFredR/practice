//
//  SearchTableViewController.swift
//  UISearchControllerStoryBoard


import UIKit


// This is a really strange to me declaring it this way but oh well.
class SearchTableViewController: UITableViewController, UISearchBarDelegate{
  
    
    var colors : [String] = []
    var filteredColors = [String]()

    
    //what a name
    @IBOutlet weak var searchBar: UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // I really need to read the swift book but I love Objective C
        
        //If this is an array from coredata you may want to do this in viewwillappear
        colors = ["Red","White","Blue","Yellow","Green","Black","Purple","Getting Tired","Have I mentioned that I like Objective C"]
        
        
        //searchbar
        searchBar.delegate = self
        searchBar.showsScopeBar = true

   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView{
            return self.filteredColors.count
        }else{
           return colors.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
 
        // This will be our color to load into the cell
        var color : String
        
        
        if tableView == self.searchDisplayController!.searchResultsTableView{
            color = self.filteredColors[(indexPath as NSIndexPath).row]as (String)
        }
        else
        {
            color = self.colors[(indexPath as NSIndexPath).row]as (String)
        }
        
        
        cell.textLabel!.text = color

        return cell
    }
    // This is where we will search our color array
    func filterContentForSearchText(_ searchText: String) {
    
        self.filteredColors = self.colors.filter({( colors: String) -> Bool in
            let stringMatch = colors.range(of: searchText)
            return (stringMatch != nil)
        })
        print(self.filteredColors)
   
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text!)
        return true
    }
}
