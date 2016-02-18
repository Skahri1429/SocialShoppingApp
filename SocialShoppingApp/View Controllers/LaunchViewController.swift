//
//  LaunchViewController.swift
//  SocialShoppingApp
//
//  Created by Pankaj Khillon on 2/18/16.
//  Copyright © 2016 Sarthak Khillon. All rights reserved.
//

import UIKit
import CoreLocation

class LaunchViewController: UIViewController, CLLocationManagerDelegate {

    var locManager = CLLocationManager()
    var userLatitude: CLLocationDegrees!
    var userLongitude: CLLocationDegrees!
    var userLongLat: CLLocation!
    
    // MARK: location stuff
    func startUpdating() {
        locManager.delegate = self
        locManager.requestWhenInUseAuthorization()
        locManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locManager.distanceFilter = kCLDistanceFilterNone
        locManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        userLatitude = { newLocation.coordinate.latitude }()
        userLongitude = { newLocation.coordinate.longitude }()
        userLongLat = CLLocation(latitude: userLatitude, longitude: userLongitude)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        //if let err = error {
        if error.code == CLError.Denied.rawValue {
            let alertController = UIAlertController (title: "Error: Location Denied", message: "Crave will not work unless location services are enabled.", preferredStyle: .Alert)
            
            let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (_) -> Void in
                let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
                if let url = settingsUrl {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
            
            alertController.addAction(settingsAction)
            alertController.addAction(cancelAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
            //}
        }
    }

    func loadingNextView() {
        self.performSegueWithIdentifier("MapSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpdating()
        self.performSelector("loadingNextView", withObject: nil, afterDelay: 10.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MapSegue" {
            if let destinationVC = segue.destinationViewController as? MapViewController {
                destinationVC.userLongLat = self.userLongLat
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
