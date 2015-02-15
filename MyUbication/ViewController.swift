//
//  ViewController.swift
//  MyUbication
//
//  Created by Jorge Crisóstomo Palacios on 2/13/15.
//  Copyright (c) 2015 videmor. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        myMap.delegate = self
        myMap.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation: CLLocation = locations[0] as CLLocation
//        var latitude:CLLocationDegrees = userLocation.coordinate.latitude
//        var longitude: CLLocationDegrees = userLocation.coordinate.longitude
        var latDelta:CLLocationDegrees = 0.014
        var lonDelta:CLLocationDegrees = 0.014
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
//        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var location = userLocation.coordinate

        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)

        
        
        myMap.setRegion(region, animated: true)
    
//        var region = MKCoordinateRegion(center: myMap.userLocation.coordinate, span: MKCoordinateSpanMake(0.007, 0.007))
//        
//        myMap.setRegion(region, animated: true)
        
        
//        myMap.removeAnnotations(myMap.annotations)
        
        
//        var annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.coordinate = myMap.userLocation.coordinate
        
//        myMap.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }


}

