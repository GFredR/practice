//
//  ViewController.swift
//  BasicsOfSwift


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var items :[String:NSInteger] = ["Cold Drinks":4, "Water bottles":2, "Burgers":4, "Ice Cream":8]
    
    var arrPlayerNumber = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Editing TableView"
        
        
        ////        Type Casting        ////
        let label = "The width is "
        let width = 60
        let widthLabel = label + String(width)
        print(widthLabel)
        
        
        
        
        ////    Add Values in String using \()      ////
        let apples = 3
        let oranges = 5
        _ = "I have \(apples) apples"
        let fruitSummary = "I have \(oranges + apples) fruits"
        print(fruitSummary)
        
        
        
        
        ////        Arrays      ////
        _ = [String]() // initialize empty array with String data type
        
        _ = [] // initialize an empty array without any data type
        
        var shoppingListArray = ["Catfish", "Water", "Tulips", "Blue Paint"] // Set data to array
        shoppingListArray[1] = "Water Bottle"   // Change data for object at Index 1
        shoppingListArray.append("Toilet Soap") // Dynamically add an object to array
        shoppingListArray.remove(at: 2)      // Dynamically remove an object from array
        print(shoppingListArray)
        
        
        
        
        ////        Dictionary      ////
        _ = [String: Float]() // initialize empty dictionary with String key & Float value data types
        
        _ = [:] // initialize an empty dictionary without any data type for key & value
        
        var heightOfStudents = [
            "Abhi": 5.8,
            "Ashok": 5.5,
            "Bhanu": 6.1,
            "Himmat": 5.10,
            "Kamaal": 5.6
        ]                       // Set data to dictionary
        
        heightOfStudents["Ashok"] = 5.4                 // Change value for provided key
        heightOfStudents["Paramjeet"] = 5.11            // Dynamically add key-value to dictonary
        heightOfStudents.removeValue(forKey: "Himmat")    // Dynamically remove value for key from dictionary
        print(heightOfStudents)
        
        
        
        
        ////        Method Call         ////
        self.forEachLoopInSwift()
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let imgBarBtnAdd = UIImage(named: "icon_add.png")
        let barBtnAddRow = UIBarButtonItem(image: imgBarBtnAdd, style: .plain, target: self, action: "insertNewRow:")
        self.navigationItem .setRightBarButton(barBtnAddRow, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func forEachLoopInSwift() {
        for player in self.arrPlayerNumber {
            if player < 12 {
                print("Player number \(player) is on field")
            } else {
                print("Player number \(player) is extra player")
            }
        }
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return self.items.count
        return self.arrPlayerNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TableCell")
        var strKeyOfDictionary = Array(self.items.keys)[indexPath.row]
        cell.textLabel.text = strKeyOfDictionary
        var strValueOfDictionary = Array(self.items.values)[indexPath.row]
        cell.detailTextLabel?.text = String(strValueOfDictionary)
        return cell */
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "TableCell")
        cell.textLabel!.text = String(self.arrPlayerNumber[(indexPath as NSIndexPath).row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Basics Of Swift", message: "You have clicked \((indexPath as NSIndexPath).row+1) row", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction (title: "Ok", style: .default, handler: {
            action in
            switch action.style {
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        self.tableView .setEditing(true, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            self.arrPlayerNumber.remove(at: (indexPath as NSIndexPath).row)
            let arrIndexesToDelete = [indexPath]
            self.tableView.deleteRows(at: arrIndexesToDelete, with: UITableViewRowAnimation.right)
        } else if (editingStyle == UITableViewCellEditingStyle.insert) {
            
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let rowContent = self.arrPlayerNumber[(sourceIndexPath as NSIndexPath).row]
        self.arrPlayerNumber.remove(at: (sourceIndexPath as NSIndexPath).row)
        self.arrPlayerNumber.insert(rowContent, at: (destinationIndexPath as NSIndexPath).row)
    }
    
    func insertNewRow(_ sender: UIBarButtonItem) {
        self.arrPlayerNumber .append(self.arrPlayerNumber.count+1)
        let indexOfLastRow = IndexPath(row: self.arrPlayerNumber.count-1, section: 0)
        let arrIndexesToInsert = [indexOfLastRow]
        self.tableView .insertRows(at: arrIndexesToInsert, with: UITableViewRowAnimation.left)
        self.tableView.scrollToRow(at: indexOfLastRow, at: UITableViewScrollPosition.bottom, animated: true)
    }
    
}

