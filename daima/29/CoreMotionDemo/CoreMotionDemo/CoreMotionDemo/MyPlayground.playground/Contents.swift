//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var currentDate = NSDate()
var formatter = NSDateFormatter()
formatter.dateFormat = "Y-M-d h:m"
var month = formatter.stringFromDate(currentDate)
var M = Int("\(month)")

