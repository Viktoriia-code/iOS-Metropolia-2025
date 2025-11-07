//
//  MemberRow.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI

struct MemberRow: View {
    var member: Member
    @ObservedObject var viewModel: MembersViewModel

    var body: some View {
        
        HStack {
            MemberImage(member: member, size: 50)
                .overlay {Circle().stroke(.gray.opacity(0.4), lineWidth: 1)}
                
            Text(member.first + " " + member.last)
            
            member.image
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)

            Spacer()
            
            Button {
                viewModel.toggleFavorite(member: member)
            } label: {
                Image(systemName: viewModel.isFavorite(member: member) ? "star.fill" : "star")
                    .foregroundStyle(viewModel.isFavorite(member: member) ? .yellow : .gray.opacity(0.7))
            }
        }
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
    MemberRow(member: sampleMember, viewModel: viewModel)
}
