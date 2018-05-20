//
//  LocationDetailsTableViewController.swift
//  nostalgia


import UIKit
import CoreLocation

class LocationDetailsTableViewController: UITableViewController {
    
    // MARK: Outlets
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: Actions
    @IBAction func doneBarButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBarButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.text = ""
        latitudeLabel.text = String(format: "%.8f", coordinate.latitude)
        longitudeLabel.text = String(format: "%.8f", coordinate.longitude)
        
        dateFormatter.dateStyle = .mediumStyle
        dateFormatter.timeStyle = .shortStyle
        
        if let placemark = placemark {
            addressLabel.text = stringFromPlacemark(placemark)
        } else {
            addressLabel.text = "No Address Found"
        }
        
        dateLabel.text = formatDate(Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Properties
    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var placemark: CLPlacemark?
    let dateFormatter = DateFormatter()
    
    // MARK : Methods
    func stringFromPlacemark(_ placemark: CLPlacemark) -> String { return
        "\(placemark.subThoroughfare) \(placemark.thoroughfare), " + "\(placemark.locality), " +
        "\(placemark.administrativeArea) \(placemark.postalCode)," + "\(placemark.country)"
    }
    
    func formatDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
