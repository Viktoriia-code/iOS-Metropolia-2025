//
//  MemberImage.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI

struct MemberImage: View {
    var member: Member
    var size: CGFloat = 40
    
    var body: some View {
        AsyncImage(url: imageURL()) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 50, height: 50)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            case .failure(_):
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .foregroundColor(.gray)
                    .background(Color.white)
                    .clipShape(Circle())
            @unknown default:
                EmptyView()
            }
        }
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
    
    MemberImage(member: sampleMember, size: 50)
}
