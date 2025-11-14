//
//  MemberRow.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI
import SwiftData

struct MemberRow: View {
    @Bindable var member: Member

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
                member.favorite.toggle()
                try? member.modelContext?.save()
            } label: {
                Image(systemName: member.favorite ? "star.fill" : "star")
                    .foregroundStyle(member.favorite ? .yellow : .gray.opacity(0.7))
            }
        }
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
    
    let container = ModelContainer(for: Member.self)
    let context = ModelContext(container)
    context.insert(sampleMember)
    
    MemberRow(member: sampleMember).modelContext(context)
}*/
