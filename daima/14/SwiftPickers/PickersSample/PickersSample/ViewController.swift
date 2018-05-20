//
//  ViewController.swift
//  PickersSample
//
//  Created by Fahim Farook on 29/11/14.
//  Copyright (c) 2014 RookSoft Ltd. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, CustomPickerDelegate {
	let isiPad = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad

	private var data = ["String Picker", "Date Picker", "Time Picker", "Date & Time Picker", "Time Zone Picker", "Font Picker", "Custom Picker"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK:- Actions
	@IBAction func showPicker() {
	}
	
	// MARK:- UITableView Delegates
	override func tableView(tv:UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
		var p:BaseSwiftPicker!
		switch (indexPath.section, indexPath.row) {
		case (0,0):
			p = DateSwiftPicker(title:"Time Picker", mode:UIDatePickerMode.Time, selected:NSDate(), done:{(pv, val) in
				print("Selected Date/Value: \(val)")
			}, cancel:{(pv) in
				print("Cancelled selection")
			})
			
		case (0,1):
			p = DateSwiftPicker(title:"Date Picker", mode:UIDatePickerMode.Date, selected:NSDate(), done:{(pv, val) in
				print("Selected Date/Value: \(val)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (0,2):
			p = DateSwiftPicker(title:"Date & Time Picker", mode:UIDatePickerMode.DateAndTime, selected:NSDate(), done:{(pv, val) in
				print("Selected Date/Value: \(val)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (0,3):
			p = DateSwiftPicker(title:"Hour & Minue Picker", mode:UIDatePickerMode.CountDownTimer, selected:60, done:{(pv, val) in
				print("Selected Date/Value: \(val)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (1,0):
			var u = [UnitDefinition]()
			var d = UnitDefinition()
			d.startValue = 1
			d.endValue = 10
			d.label = "kg"
			u.append(d)
			p = NumericUnitSwiftPicker(title:"Weight Range", units:u, selections:[2], done:{(pv, vals) in
				print("Selected Value: \(vals)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (1,1):
			var u = [UnitDefinition]()
			// Kg
			var d = UnitDefinition()
			d.startValue = 0
			d.endValue = 10
			d.label = "kg"
			u.append(d)
			// Gram
			d = UnitDefinition()
			d.startValue = 0
			d.endValue = 1000
			d.increment = 100
			d.label = "g"
			u.append(d)
			p = NumericUnitSwiftPicker(title:"Weight Range", units:u, selections:[2, 500], done:{(pv, vals) in
				print("Selected Values: \(vals)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (1,2):
			var u = [UnitDefinition]()
			// Hours
			var d = UnitDefinition()
			d.startValue = 0
			d.endValue = 24
			d.label = "h"
			u.append(d)
			// Minutes
			d = UnitDefinition()
			d.startValue = 0
			d.endValue = 60
			d.increment = 5
			d.label = "m"
			u.append(d)
			// Seconds
			d = UnitDefinition()
			d.startValue = 0
			d.endValue = 60
			d.increment = 10
			d.label = "s"
			u.append(d)
			p = NumericUnitSwiftPicker(title:"Hours, Minutes, Seconds", units:u, selections:[0, 5, 30], done:{(pv, vals) in
				print("Selected Values: \(vals)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (1,3):
			var u = [UnitDefinition]()
			// Nort
			var d = UnitDefinition()
			d.startValue = 0
			d.endValue = 10
			d.label = "N"
			u.append(d)
			// East
			d = UnitDefinition()
			d.startValue = 0
			d.endValue = 10
			d.label = "E"
			u.append(d)
			// South
			d = UnitDefinition()
			d.startValue = 0
			d.endValue = 10
			d.label = "S"
			u.append(d)
			// West
			d = UnitDefinition()
			d.startValue = 0
			d.endValue = 10
			d.label = "W"
			u.append(d)
			p = NumericUnitSwiftPicker(title:"Four Corners", units:u, selections:[2,5,8,3], done:{(pv, vals) in
				print("Selected Values: \(vals)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (2, 0):
			let data = ["Red", "Blue", "Green", "Yellow"]
			p = StringSwiftPicker(title:"Colours", data:data, selected:0, done:{(pv, index, value) in
				print("Selected item: \(index) with value: \(value)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (2, 1):
			p = TimeZoneSwiftPicker(title:"Time Zones", selected:NSTimeZone.defaultTimeZone(), done:{(pv, value) in
				print("Selected zone: \(value)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (2, 2):
			p = FontSwiftPicker(title:"Fonts", selected:UIFont.systemFontOfSize(14), done:{(pv, value) in
				print("Selected font: \(value)")
				}, cancel:{(pv) in
					print("Cancelled selection")
			})
			
		case (2, 3):
			p = CustomSwiftPicker(title:"Picker Types", delegate:self, done:{(pv, picker) in
				// Handle action
				let row = picker.selectedRowInComponent(0)
				print("Selected row \(row) in custom picker")
			}, cancel:{(pv) in
				print("Cancelled selection")
			})
			
		default:
			print("Unspecified selection. Check your code!")
		}
		if p != nil {
			p.showPicker(self)
		}
	}
	
	// MARK:- Custom Picker Delegates
	func numberOfComponentsInPickerView(pv:UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(pv:UIPickerView, numberOfRowsInComponent component:Int) -> Int {
		return data.count
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
		return data[row]
	}
}

