//
//  personTVC.swift
//  inlineDatePicker


import UIKit

class personTVC: UITableViewController {
    
    let kDatePickerTag = 2
    
    let kPersonCellID = "personCell"
    let kDatePickerCellID = "datePickerCell"
    
    var data: [Person] = []
    var dateFormatter = NSDateFormatter()
    
    var datePickerIndexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        createUselessData()
        
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .NoStyle
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Helper methods
    
    func createUselessData() {
        let person1 = Person(name: "Johnathan Watson", date: NSDate(timeIntervalSince1970: 6324480000))
        let person2 = Person(name: "Hazel Lindsey", date: NSDate(timeIntervalSince1970: 123456789))
        let person3 = Person(name: "Lola Paul", date: NSDate(timeIntervalSince1970: 2349872398))
        let person4 = Person(name: "Lynn Walsh", date: NSDate(timeIntervalSince1970: 6524480000))
        let person5 = Person(name: "Jacqueline Ramos", date: NSDate(timeIntervalSince1970: 2952972398))
        let person6 = Person(name: "Bobbie Casey", date: NSDate(timeIntervalSince1970: 6354580800))
        
        data.append(person1)
        data.append(person2)
        data.append(person3)
        data.append(person4)
        data.append(person5)
        data.append(person6)
    }
    
    func hasInlineDatePicker() -> Bool {
        if (datePickerIndexPath != nil) {
            return true
        } else {
            return false
        }
    }
    
    func displayInlinePickerAtIndexPath(indexPath: NSIndexPath) {
        tableView.beginUpdates()
        datePickerIndexPath = indexPath
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        tableView.endUpdates()
    }
    
    func hidePickerCell() {
        tableView.beginUpdates()
        tableView.deleteRowsAtIndexPaths([datePickerIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
        datePickerIndexPath = nil
        tableView.endUpdates()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = data.count
        if (hasInlineDatePicker()) {
            rows++
        }
        return rows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (datePickerIndexPath?.row == indexPath.row) {
            let person = data[indexPath.row-1]
            let cell = tableView.dequeueReusableCellWithIdentifier(kDatePickerCellID, forIndexPath: indexPath) as UITableViewCell
            let targetedDatePicker = cell.viewWithTag(kDatePickerTag) as! UIDatePicker
            targetedDatePicker.setDate(person.date, animated: false)
            return cell
        } else {
            var modelRow = indexPath.row
            if (datePickerIndexPath != nil && datePickerIndexPath?.row <= indexPath.row) {
                modelRow--
            }
            let cell = tableView.dequeueReusableCellWithIdentifier(kPersonCellID, forIndexPath: indexPath) as UITableViewCell
            let person = data[modelRow] as Person
            cell.textLabel!.text = person.name
            cell.detailTextLabel!.text = dateFormatter.stringFromDate(person.date)
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.cellForRowAtIndexPath(indexPath)
        
        var newPickerRow = Int()
        var currentPickerRow: Int?
        
        newPickerRow = indexPath.row + 1
        
        if hasInlineDatePicker() {
            currentPickerRow = datePickerIndexPath?.row
            if (newPickerRow > currentPickerRow) {
                newPickerRow -= 1
            }
            hidePickerCell()
            if (newPickerRow == currentPickerRow) {
                return
            }
        }
        
        let pickerIndexPath = NSIndexPath(forRow: newPickerRow, inSection: 0)
        displayInlinePickerAtIndexPath(pickerIndexPath)
    }
    
    // MARK: - UIDatePicker Action Method
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        if (hasInlineDatePicker()) {
            let parentCellIndexPath = NSIndexPath(forRow: datePickerIndexPath!.row-1, inSection: 0)
            let person = data[parentCellIndexPath.row]
            person.date = sender.date
            
            if let parentCell = tableView.cellForRowAtIndexPath(parentCellIndexPath) {
                parentCell.detailTextLabel?.text = dateFormatter.stringFromDate(sender.date)
            }
        } else {
            return
        }
    }

}
