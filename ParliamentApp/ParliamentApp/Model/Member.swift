//
//  Member.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Member {
    @Attribute(.unique) var personNumber: Int
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
    var favorite: Bool
    var note: String
    
    init(
        personNumber: Int,
        seatNumber: Int,
        last: String,
        first: String,
        party: String,
        minister: Bool,
        picture: String,
        twitter: String,
        bornYear: Int,
        constituency: String,
        favorite: Bool = false,
        note: String = ""
    ) {
        self.personNumber = personNumber
        self.seatNumber = seatNumber
        self.last = last
        self.first = first
        self.party = party
        self.minister = minister
        self.picture = picture
        self.twitter = twitter
        self.bornYear = bornYear
        self.constituency = constituency
        self.favorite = false
        self.note = ""
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

