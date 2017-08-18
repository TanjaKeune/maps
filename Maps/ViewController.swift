//
//  ViewController.swift
//  Maps
//
//  Created by Tanja Keune on 8/18/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //set a location on a map
        
        let latitude: CLLocationDegrees = 40.623481
        let longitude: CLLocationDegrees = -74.018134
        
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
//      add annotation
        
        let annotaion = MKPointAnnotation()
        
        annotaion.title = "Home"
        annotaion.subtitle = "Home Sweet home"
        
        annotaion.coordinate = location
        mapView.addAnnotation(annotaion)
        
//      user adds annotations with long press
        
//        user interface long press gesture recognizer
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        mapView.addGestureRecognizer(uilpgr)
    
    
    }

    func longPress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        annotation.subtitle = "LALA"
        
        mapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

