//
//  ViewController.swift
//  ARKITTest
//
//  Created by Nafisa Rahman on 12/20/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol AddPinHandler : class {
    func addPin(touchedPt: MKAnnotation) -> ()
}

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    //MARK:- outlets and declarations
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var userLocation : CLLocationCoordinate2D?
    
    lazy var viewModel = PinViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        mapView.setUserTrackingMode(.follow, animated: true)
        
        //
        viewModel.delegate = self
        
        //MARK: Configure location manager
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            
            locationManager.requestAlwaysAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        //MARK: Add tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.detectTapLocation(_:)))
        
        mapView.addGestureRecognizer(tap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Tap gesture action
    @objc func detectTapLocation(_ sender: UITapGestureRecognizer){
        
        print("tapped")
        let touchLocation = sender.location(in: mapView)
        //
        viewModel.touchLocation = touchLocation
        
        let touchCoordinate = mapView.convert(touchLocation,toCoordinateFrom: mapView)
        
        //MARK: pass touch coordinate to view model
        viewModel.locationTouched(title: "", coordinate: touchCoordinate)
        
    }
    
    
    
    
    //MARK: Core Location
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        let location  = locations.last!
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        userLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
    }
    
    
    //MARK: error in getting user location
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error)
    {
        turnOnLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
            
        case .notDetermined:
            manager.requestAlwaysAuthorization()
            
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
            
        case .authorizedAlways:
            manager.startUpdatingLocation()
            
        case .restricted:
            turnOnLocation()
            
        case .denied:
            turnOnLocation()
            
        }
    }
    
    func turnOnLocation() {
        //if time permits add an alert
        print("turn on your location")
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  viewModel.allTouchedLocations.count > 0 {
            
            if let destinationController = segue.destination as? ARViewController {
                
                destinationController.allTouchLoc = viewModel.allTouchedLocations
            }
        }
    }
    
    
}

extension MapViewController : AddPinHandler {
    
    //MARK: Add annotation to mapview
    func addPin(touchedPt: MKAnnotation) -> () {
        self.mapView.addAnnotation(touchedPt)
    }
}

