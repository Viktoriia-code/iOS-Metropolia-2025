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
    @ObservedObject var viewModel: MembersViewModel
    
    var body: some View {
        VStack {
            // Member location map
            Map(initialPosition: .region(region)).frame(height: 250)
            
            MemberImage(member: member, size: 220)
                .overlay {Circle().stroke(.white, lineWidth: 4)}
                .shadow(radius: 7)
                .offset(y: -130)
                .padding(.bottom, -120)
            
            // Member image
            member.image
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 7)
                .offset(x: 85, y: -105)
                .padding(.bottom, -270)
            
            // Member details
            VStack(alignment: .leading) {
                HStack {
                    Text("\(member.first) \(member.last)")
                        .font(.title)
                    
                    Button {
                        viewModel.toggleFavorite(member: member)
                    } label: {
                        Image(systemName: viewModel.isFavorite(member: member) ? "star.fill" : "star")
                            .foregroundStyle(viewModel.isFavorite(member: member) ? .yellow : .gray.opacity(0.7))
                    }
                }

                
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
    private func imageURL() -> URL? {
        let base = "https://users.metropolia.fi/~peterh/edustajakuvat/"
        
        // Extract the last path component
        let filename = URL(fileURLWithPath: member.picture).lastPathComponent
        
        // Remove versioning "-vXXXX" using regex
        var cleaned = filename.replacingOccurrences(of: "-v\\d+", with: "", options: .regularExpression)
        
        // Ensure lowercase .jpg extension
        cleaned = cleaned.replacingOccurrences(of: ".JPG", with: ".jpg")
        
        // Final URL
        let finalURL = base + cleaned
        //print("Fetching image from:", finalURL)
        return URL(string: finalURL)
    }


}

#Preview {
    let sampleMember = Member(
        personNumber: 1099,
        seatNumber: 72,
        last: "Eloranta",
        first: "Eeva-Johanna",
        party: "sd",
        minister: false,
        picture:"attachment/member/pictures/Eloranta-Eeva-Johanna-web-v6995-1099.JPG",
        twitter: "https://twitter.com/elorantaeevajoh",
        bornYear: 1966,
        constituency: "Varsinais-Suomi"
    )
    
    let viewModel = MembersViewModel()
    MemberDetail(member: sampleMember, viewModel: viewModel)
}
