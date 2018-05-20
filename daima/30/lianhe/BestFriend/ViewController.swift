//
//  ViewController.swift
//  BestFriend
//
//  Created by John Ray on 11/10/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

//
//  ViewController.swift


import UIKit
import MapKit
import CoreLocation
import MessageUI
import Social
import Contacts
import ContactsUI
import SafariServices

class ViewController: UIViewController, CNContactPickerDelegate, MFMailComposeViewControllerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var web: UIButton!
    
    let locMan:CLLocationManager=CLLocationManager()
    
    @IBAction func openWeb(_ sender: AnyObject) {
        let safariController =
        SFSafariViewController(url: URL(string:
            web.title(for: UIControlState())!)!)
        self.present(safariController,
            animated: true, completion: nil)
    }
    
    @IBAction func newBFF(_ sender: AnyObject) {
        let picker: CNContactPickerViewController = CNContactPickerViewController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func sendEmail(_ sender: AnyObject) {
        let emailAddresses:[String]=[self.email.text!]
        let mailComposer:MFMailComposeViewController =
        MFMailComposeViewController()
        mailComposer.mailComposeDelegate=self;
        mailComposer.setToRecipients(emailAddresses)
        
        present(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult, error: NSError?) {
            dismiss(animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController,
        didSelect contact: CNContact) {
            name.text = "\(contact.givenName) \(contact.familyName)"
            email.text = contact.emailAddresses.first!.value as? String
            if contact.imageDataAvailable {
                photo.image = UIImage(data: contact.imageData!)
            }
            showAddress(contact.postalAddresses.first!.value )
            web.setTitle(contact.urlAddresses.first!.value as? String, for: UIControlState())
    }
    
    
    func showAddress(_ fullAddress:CNPostalAddress) {
        let addressString: String = "\(fullAddress.street),\(fullAddress.city),\(fullAddress.state),\(fullAddress.postalCode)"
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString, completionHandler:
            {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                let friendPlacemark:CLPlacemark = placemarks![0]
                let mapRegion:MKCoordinateRegion =
                MKCoordinateRegion(center: friendPlacemark.location!.coordinate,
                    span: MKCoordinateSpanMake(0.2, 0.2))
                self.map.setRegion(mapRegion, animated: true)
                let mapPlacemark: MKPlacemark = MKPlacemark(placemark: friendPlacemark)
                self.map.addAnnotation(mapPlacemark)
        })
        
    }
    
    func mapView(_ aMapView: MKMapView,
        viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let pinDrop:MKPinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myspot")
            pinDrop.animatesDrop=true
            pinDrop.canShowCallout=true
            pinDrop.pinTintColor=UIColor.blue()
            return pinDrop
    }
    
    
    
    @IBAction func sendTweet(_ sender: AnyObject) {
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(map.userLocation.location!, completionHandler:
            {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                let myPlacemark:CLPlacemark = placemarks![0]
                let tweetText:String =
                "Hello all - I'm currently in \(myPlacemark.locality!)!"
                
                let tweetComposer: SLComposeViewController =
                SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                
                if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                    tweetComposer.setInitialText(tweetText)
                    self.present(tweetComposer, animated: true, completion: nil)
                }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locMan.requestWhenInUseAuthorization()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
}

