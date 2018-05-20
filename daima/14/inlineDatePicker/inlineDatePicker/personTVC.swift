//
//  personTVC.swift
//  inlineDatePicker


import UIKit

class personTVC: UITableViewController {
    
    let kDatePickerTag = 2
    
    let kPersonCellID = "personCell"
    let kDatePickerCellID = "datePickerCell"
    
    var data: [Person] = []
    var dateFormatter = DateFormatter()
    
    var datePickerIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        createUselessData()
        
        dateFormatter.dateStyle = .shortStyle
        dateFormatter.timeStyle = .noStyle
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Helper methods
    
    func createUselessData() {
        let person1 = Person(name: "Johnathan Watson", date: Date(timeIntervalSince1970: 6324480000))
        let person2 = Person(name: "Hazel Lindsey", date: Date(timeIntervalSince1970: 123456789))
        let person3 = Person(name: "Lola Paul", date: Date(timeIntervalSince1970: 2349872398))
        let person4 = Person(name: "Lynn Walsh", date: Date(timeIntervalSince1970: 6524480000))
        let person5 = Person(name: "Jacqueline Ramos", date: Date(timeIntervalSince1970: 2952972398))
        let person6 = Person(name: "Bobbie Casey", date: Date(timeIntervalSince1970: 6354580800))
        
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
    
    func displayInlinePickerAtIndexPath(_ indexPath: IndexPath) {
        tableView.beginUpdates()
        datePickerIndexPath = indexPath
        tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        tableView.endUpdates()
    }
    
    func hidePickerCell() {
        tableView.beginUpdates()
        tableView.deleteRows(at: [datePickerIndexPath!], with: UITableViewRowAnimation.fade)
        datePickerIndexPath = nil
        tableView.endUpdates()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = data.count
        if (hasInlineDatePicker()) {
            rows += 1
        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (datePickerIndexPath?.row == (indexPath as NSIndexPath).row) {
            let person = data[(indexPath as NSIndexPath).row-1]
            let cell = tableView.dequeueReusableCell(withIdentifier: kDatePickerCellID, for: indexPath) as UITableViewCell
            let targetedDatePicker = cell.viewWithTag(kDatePickerTag) as! UIDatePicker
            targetedDatePicker.setDate(person.date as Date, animated: false)
            return cell
        } else {
            var modelRow = (indexPath as NSIndexPath).row
            if (datePickerIndexPath != nil && datePickerIndexPath?.row <= (indexPath as NSIndexPath).row) {
                modelRow -= 1
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: kPersonCellID, for: indexPath) as UITableViewCell
            let person = data[modelRow] as Person
            cell.textLabel!.text = person.name
            cell.detailTextLabel!.text = dateFormatter.string(from: person.date as Date)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.cellForRow(at: indexPath)
        
        var newPickerRow = Int()
        var currentPickerRow: Int?
        
        newPickerRow = (indexPath as NSIndexPath).row + 1
        
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
        
        let pickerIndexPath = IndexPath(row: newPickerRow, section: 0)
        displayInlinePickerAtIndexPath(pickerIndexPath)
    }
    
    // MARK: - UIDatePicker Action Method
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        if (hasInlineDatePicker()) {
            let parentCellIndexPath = IndexPath(row: datePickerIndexPath!.row-1, section: 0)
            let person = data[(parentCellIndexPath as NSIndexPath).row]
            person.date = sender.date
            
            if let parentCell = tableView.cellForRow(at: parentCellIndexPath) {
                parentCell.detailTextLabel?.text = dateFormatter.string(from: sender.date)
            }
        } else {
            return
        }
    }

}
