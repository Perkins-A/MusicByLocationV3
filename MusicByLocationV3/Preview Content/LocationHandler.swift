//
//  LocationHandler.swift
//  MusicByLocationV3
//
//  Created by Perkins, Alexander (ABH) on 13/03/2023.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    weak var stateController: StateController?
    
    @Published var lastKnownLocation: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.stateController?.lastKnownLocation = "Could not perform look up of location from coordinate information"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.stateController?.lastKnownLocation = firstPlacemark.locality ?? ""
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.stateController?.lastKnownLocation = "Error finding location"
    }
}

