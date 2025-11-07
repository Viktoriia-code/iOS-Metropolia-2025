//
//  MemberDetail.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 31.10.2025.
//

import SwiftUI
import CoreLocation
import MapKit

struct MemberDetail: View {
    let member: Member
    
    var body: some View {
        VStack {
            // Member location map
            Map(initialPosition: .region(region)).frame(height: 290)
            
            // Member image
            member.image
                .scaledToFit()
                .frame(width: 150, height: 150)
                .background(Color.white)
                .clipShape(Circle())
                .overlay {Circle().stroke(.white, lineWidth: 4)}
                .shadow(radius: 7)
                .offset(y: -140)
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
            .navigationTitle("About \(member.first) \(member.last)")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            
            Spacer()
        }
    }
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 60.45, longitude: 22.27),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    /*let exampleMember = Member(
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
        // coordinate: CLLocationCoordinate2D(latitude: 60.45, longitude: 22.27)
    )*/
    
    MemberDetail(member: members[0])
}
