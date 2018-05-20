//
//  ViewController.swift


import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var waitView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    
    let kCupertinoLatitude: CLLocationDegrees = 37.3229978
    let kCupertinoLongitude: CLLocationDegrees = -122.0321823
    
    @objc(locationManager:didUpdateLocations:) func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        if newLocation.horizontalAccuracy >= 0 {
            let Cupertino:CLLocation = CLLocation(latitude: kCupertinoLatitude,longitude: kCupertinoLongitude)
            let delta:CLLocationDistance = Cupertino.distance(from: newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
            if miles < 3 {
                // Stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "欢迎你\n成为我们的一员!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                distanceLabel.text=commaDelimited.string(from: miles)!+"%@ 英里\n到Apple"
            }
            waitView.isHidden = true
            distanceView.isHidden = false
        }
        // oldLocation=locations[0] as CLLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: NSError) {
        if error.code == CLError.denied.rawValue {
            locMan.stopUpdatingLocation()
        } else {
            waitView.isHidden = true
            distanceView.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }


}

