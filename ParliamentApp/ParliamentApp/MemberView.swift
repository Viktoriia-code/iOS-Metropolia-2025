//
//  MemberView.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 31.10.2025.
//

import SwiftUI
import CoreLocation
import MapKit

struct Member: Identifiable {
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
    var coordinate: CLLocationCoordinate2D
}

struct MemberView: View {
    let member: Member
    
    var body: some View {
        VStack {
            // Member location map
            Map(initialPosition: .region(region)).frame(height: 290)
            
            // Member image
            Image(member.picture)
                .clipShape(Circle())
                .overlay {Circle().stroke(.white, lineWidth: 4)}
                .shadow(radius: 7)
                .offset(y: -200)
                .padding(.bottom, -270)
            
            // Member details
            VStack(alignment: .leading) {
                Text("\(member.first) \(member.last)")
                    .font(.title)
                
                Divider()
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Party: \(member.party.uppercased())")
                        Text("Constituency: \(member.constituency)")
                        Text("Person Number: \(String(member.personNumber))")
                        Text("Seat Number: \(member.seatNumber)")
                        Text("Minister: \(member.minister ? "Yes" : "No")")
                    }
                    Spacer()
                    Text("Born: \(String(member.bornYear))")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Divider()

                // Twitter link
                if let url = URL(string: member.twitter) {
                    Link("Follow on Twitter", destination: url)
                        .padding()
                        .background(Color.blue)
                        .font(.headline)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()

            Spacer()
        }
    }
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: member.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
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
