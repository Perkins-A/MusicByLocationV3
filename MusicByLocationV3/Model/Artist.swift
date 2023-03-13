//
//  Artist.swift
//  MusicByLocationV3
//
//  Created by Perkins, Alexander (ABH) on 13/03/2023.
//

import Foundation

struct Artist: Codable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
    }
}
