//
//  Member.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import Foundation
import SwiftUI

struct Member: Hashable, Codable, Identifiable {
    var id: Int { personNumber }
    var personNumber: Int
    var seatNumber: Int
    var last: String
    var first: String
    var party: String
    var minister: Bool
    var picture: String
    var twitter: String
    var bornYear: Int
    var constituency: String
    // var coordinate: CLLocationCoordinate2D
    var image: Image {
        Image(party)
    }
    
    /*private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }*/
}

