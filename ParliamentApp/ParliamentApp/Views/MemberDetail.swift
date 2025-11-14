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
    @Bindable var member: Member
    @State private var newNote: String
    
    init(member: Member) {
        self.member = member
        self._newNote = State(initialValue: member.note)
    }
    
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
                        member.favorite.toggle()
                    } label: {
                        Image(systemName: member.favorite ? "star.fill" : "star")
                            .foregroundStyle(member.favorite ? .yellow : .gray.opacity(0.7))
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
            
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("Note about \(member.first) \(member.last)")
                        .font(.headline)
                    TextField("Note", text: $newNote)
                        .textFieldStyle(.roundedBorder)
                    Button("Save") {
                        member.note = newNote
                    }
                    .bold()
                }
            }
            .padding()
            .background(.bar)
            
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

/*#Preview {
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
}*/
