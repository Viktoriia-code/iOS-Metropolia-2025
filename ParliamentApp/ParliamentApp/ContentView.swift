//
//  ContentView.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 31.10.2025.
//

import SwiftUI
import CoreLocation

struct ContentView: View {

    var body: some View {
        let exampleMember = Member(
            personNumber: 1099,
            seatNumber: 72,
            last: "Eloranta",
            first: "Eeva-Johanna",
            party: "sd",
            minister: false,
            picture: "Eloranta-Eeva-Johanna",
            twitter: "https://twitter.com/elorantaeevajoh",
            bornYear: 1966,
            constituency: "Varsinais-Suomi",
            coordinate: CLLocationCoordinate2D(latitude: 60.45, longitude: 22.27)
        )
        
        MemberView(member: exampleMember)
    }
}

#Preview {
    ContentView()
}
