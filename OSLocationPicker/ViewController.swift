//
//  ViewController.swift
//  OSLocationPicker
//
//  Created by Usama Sadiq on 02/04/2017.
//  Copyright © 2017 Devoders. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager:CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if locationManager == nil{
            locationManager = CLLocationManager()
            locationManager?.requestWhenInUseAuthorization()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.distanceFilter = 100
            locationManager?.delegate = self

            locationManager?.startUpdatingLocation()
        }
        
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count>0 {
            let location = locations.last
            mapView.region = MKCoordinateRegionMakeWithDistance(location!.coordinate, 100, 100)
        }
    }
}

