//
//  CLPlacemarksExtension.swift
//  MusicByLocationV3
//
//  Created by Perkins, Alexander (ABH) on 13/03/2023.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationBreakdown() -> String {
        return
            """
            Country: \(self.country ?? "No Country")
            City: \(self.locality ?? "No City")
            Interests: \((self.areasOfInterest ?? ["Nothing Interesting"])[0])
            """
        
    }
}
