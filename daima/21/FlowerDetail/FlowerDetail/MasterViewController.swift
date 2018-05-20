//
//  MasterViewController.swift
//  FlowerDetail


import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()

    var flowerData: [AnyObject] = []
    var flowerSections: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createFlowerData()
        
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()

        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: AnyObject) {
        objects.insert(Date(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                //controller.detailItem = object
                controller.detailItem=self.flowerData[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return flowerSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowerData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flowerCell", for: indexPath)

        //let object = objects[indexPath.row] as! NSDate
        //cell.textLabel!.text = object.description
        
        cell.textLabel!.text = flowerData[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["name"] as! String!
        cell.detailTextLabel!.text = flowerData[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["url"] as! String!
        
        cell.imageView!.image = UIImage(named: flowerData[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]["picture"] as! String!)!

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return flowerSections[section]
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func createFlowerData() {
        var redFlowers: [Dictionary<String,String>] = []
        var blueFlowers: [Dictionary<String,String>] = []
        
        flowerSections = ["Red Flowers","Blue Flowers"]
        
        redFlowers.append(["name":"AA","picture":"Poppy.png","url":"https://en.wikipedia.org/wiki/Poppy"])
        redFlowers.append(["name":"BB","picture":"Tulip.png","url":"https://en.wikipedia.org/wiki/Tulip"])
        redFlowers.append(["name":"CC","picture":"Gerbera.png","url":"https://en.wikipedia.org/wiki/Gerbera"])
        redFlowers.append(["name":"DD","picture":"Peony.png","url":"https://en.wikipedia.org/wiki/Peony"])
        redFlowers.append(["name":"EE","picture":"Rose.png","url":"https://en.wikipedia.org/wiki/Rose"])
        redFlowers.append(["name":"FF","picture":"Hollyhock.png","url":"https://en.wikipedia.org/wiki/Hollyhock"])
        redFlowers.append(["name":"GG Flower","picture":"Strawflower.png","url":"https://en.wikipedia.org/wiki/Peony"])
        
        blueFlowers.append(["name":"HH","picture":"Hyacinth.png","url":"https://en.wikipedia.org/wiki/Hyacinth_(flower)"])
        blueFlowers.append(["name":"II","picture":"Hydrangea.png","url":"https://en.wikipedia.org/wiki/Hydrangea"])
        blueFlowers.append(["name":"JJ Holly","picture":"Sea Holly.png","url":"https://en.wikipedia.org/wiki/Sea_holly"])
        blueFlowers.append(["name":"KK","picture":"Grape Hyacinth.png","url":"https://en.wikipedia.org/wiki/Grape_hyacinth"])
        blueFlowers.append(["name":"LL","picture":"Phlox.png","url":"https://en.wikipedia.org/wiki/Phlox"])
        blueFlowers.append(["name":"MM Cushion Flower","picture":"Pincushion flower.png","url":"https://en.wikipedia.org/wiki/Scabious"])
        blueFlowers.append(["name":"NN","picture":"Iris.png","url":"https://en.wikipedia.org/wiki/Iris_(plant)"])
        
        flowerData=[redFlowers,blueFlowers]
    }


}

