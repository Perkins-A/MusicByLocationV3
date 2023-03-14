//
//  StateController.swift
//  MusicByLocationV3
//
//  Created by Perkins, Alexander (ABH) on 13/03/2023.
//

import Foundation

class StateController: ObservableObject {
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    @Published var artistsByLocation: String = ""
    
    var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsByLocation)
        }
    }
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtistsByLocation(artists: ([Artist]?)) {
        let names = artists?.map { return $0.name }
        
        DispatchQueue.main.async {
            self.artistsByLocation = names?.joined(separator: ", ") ?? "Error findng Artists from your location"
        }
    }
}
