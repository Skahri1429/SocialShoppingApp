//
//  MapViewController.swift
//  SocialShoppingApp
//
//  Created by Pankaj Khillon on 2/17/16.
//  Copyright © 2016 Sarthak Khillon. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var userLongLat: CLLocation? = CLLocation(latitude: 21.282778, longitude: -157.829444)
    // MARK: outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dropoffTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
        
    // MARK: map functions
    let regionRadius: CLLocationDistance = 5000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: system functions
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(userLongLat!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
