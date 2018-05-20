//
//  ViewController.swift
//  EchoTime


import UIKit

class ViewController: UIViewController {
    
    var c1: IntervalPickerController!
    var c2: IntervalPickerController!
    
    @IBOutlet weak var MinutesTableView: UITableView!
    @IBOutlet weak var SecondsTableView: UITableView!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet var MainView: UIView!

    @IBAction func startTimer(sender: AnyObject) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "StartTimerSegue"
        {
            if let destinationVC = segue.destinationViewController as? TimerViewController {
                let minutes = c1.getSelectedValue(MinutesTableView)
                let seconds = c2.getSelectedValue(SecondsTableView)
                destinationVC.speakInterval = Int(minutes)! * 60 + Int(seconds)!
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = MainView.bounds;
        gradient.colors = [UIColor(red: 63/255.0, green: 76/255.0, blue: 107/255.0, alpha: 1.0).CGColor, UIColor(red: 96/255.0, green: 108/255.0, blue: 136/255.0, alpha: 1.0).CGColor]
        MainView.layer.insertSublayer(gradient, atIndex: 0)
        
        var timeUnits: Array<Dictionary<String, String>> = []
        
        for i in [Int](0...60) {
            timeUnits.append(["index": String(i), "text": String(format: "%02d", i)])
        }
        
        let numberOfRows: Int = 8
        
        c1 = IntervalPickerController(tableData: timeUnits, tableView: &MinutesTableView, numberOfRows: numberOfRows)
        c2 = IntervalPickerController(tableData: timeUnits, tableView: &SecondsTableView, numberOfRows: numberOfRows)
        
        MinutesTableView.dataSource = c1
        MinutesTableView.delegate = c1
        SecondsTableView.dataSource = c2
        SecondsTableView.delegate = c2
        
        MinutesTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        MinutesTableView.backgroundColor = UIColor.clearColor()
        SecondsTableView.backgroundColor = UIColor.clearColor()
        
        MinutesTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        SecondsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
        StartButton.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        if c1.initialLoad {
            let rowHeight = Float(MinutesTableView.frame.height) / Float(c1.numberOfRows)
            
            MinutesTableView.rowHeight = CGFloat(rowHeight)
            SecondsTableView.rowHeight = CGFloat(rowHeight)
            
            MinutesTableView.contentOffset.y = (CGFloat(c1.tableData.count) * 0.5 - CGFloat(3.1)) * CGFloat(rowHeight)
            SecondsTableView.contentOffset.y = (CGFloat(c2.tableData.count) * 0.5 + CGFloat(26.1)) * CGFloat(rowHeight)
            
            MinutesTableView.reloadData()
            SecondsTableView.reloadData()
            
            c1.scrollToCellTop(MinutesTableView)
            c2.scrollToCellTop(SecondsTableView)
            
            c1.initialLoad = false
            c2.initialLoad = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class IntervalPickerController: NSObject, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate  {
    let tableData: Array<Dictionary<String, String>>!
    let tableView: UITableView!
    let numberOfRows: Int!
    var cleanedTableView = false
    var initialLoad = true
    
    init(tableData: Array<Dictionary<String, String>>, inout tableView: UITableView!, numberOfRows: Int) {
        
        var loopedData: Array<Dictionary<String, String>> = []

        for i in 1...50 {
            loopedData += tableData
        }
        
        self.tableData = loopedData
        self.tableView = tableView
        self.numberOfRows = numberOfRows
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollToCellTop(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        setTextOfMiddleElement(scrollView)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollToCellTop(scrollView)
        }
    }
    
    func scrollToCellTop(scrollView: UIScrollView) {
        let tableViewOffset = scrollView.contentOffset.y
//        println("tableViewOffset \(tableViewOffset)")
        let visibleTableViewHeight = scrollView.frame.height
//        println("visibleTableViewHeight \(visibleTableViewHeight)")
        let cellHeight = tableView.rectForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)).height
//        println("cellHeight \(cellHeight)")
        
        let heightOfFullHiddenCellsAbove = tableViewOffset - (tableViewOffset % cellHeight)
//        println("heightOfFullHiddenCellsAbove \(heightOfFullHiddenCellsAbove)")
        let halfViewMinusMiddleCell = (visibleTableViewHeight - cellHeight) / 2
//        println("halfViewMinusMiddleCell \(halfViewMinusMiddleCell)")
        let offsetAdjustment = cellHeight - (halfViewMinusMiddleCell % cellHeight)
//        println("offsetAdjustment \(offsetAdjustment)")
        
        if self.numberOfRows % 2 == 1 {
            if ((tableViewOffset % cellHeight) < (cellHeight / 2)) {
                scrollView.setContentOffset(CGPointMake(0, CGFloat(tableViewOffset - (tableViewOffset % cellHeight))), animated: true)
            } else {
                scrollView.setContentOffset(CGPointMake(0, CGFloat(tableViewOffset + cellHeight - (tableViewOffset % cellHeight))), animated: true)
            }
        } else {
            scrollView.setContentOffset(CGPointMake(0, CGFloat(tableViewOffset + (cellHeight / 2) - (tableViewOffset % cellHeight))), animated: true)
        }
    }
    
    func setTextOfMiddleElement(scrollView: UIScrollView) {
        let tableViewOffset = scrollView.contentOffset.y
        let totalTableViewHeight = scrollView.contentSize.height
        let visibleTableViewHeight = scrollView.frame.height
        let cellHeight = tableView.rectForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)).height
        let cellsOnScreen = visibleTableViewHeight / cellHeight
        
        let middleRowIndex = (cellsOnScreen / 2) + (tableViewOffset / cellHeight)
        tableView.cellForRowAtIndexPath(NSIndexPath(forRow: Int(middleRowIndex), inSection: 0))?.textLabel?.textColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
        self.cleanedTableView = false
    }
    
    func getSelectedValue(scrollView: UIScrollView) -> String {
        let tableViewOffset = scrollView.contentOffset.y
        let totalTableViewHeight = scrollView.contentSize.height
        let visibleTableViewHeight = scrollView.frame.height
        let cellHeight = tableView.rectForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)).height
        let cellsOnScreen = visibleTableViewHeight / cellHeight
        
        let middleRowIndex = (cellsOnScreen / 2) + (tableViewOffset / cellHeight)
        let tableCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: Int(middleRowIndex), inSection: 0))
        return tableCell!.textLabel!.text!
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if !self.cleanedTableView {
            for cell in tableView.visibleCells {
                cell.textLabel!.textColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:0.4)
            }
            self.cleanedTableView = true
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let item = tableData[indexPath.row]
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.textLabel?.text = String(stringInterpolationSegment: item["text"]!)
        // TODO: Set font height to be multiple of cell height by default (add option to choose)
        let myFont = UIFont(name: "Avenir-Light", size: 46.0);
        cell.textLabel!.font  = myFont;
        cell.textLabel?.textColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:0.4)
        return cell
    }
}