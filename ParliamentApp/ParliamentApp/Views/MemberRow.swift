//
//  MemberRow.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI

struct MemberRow: View {
    var member: Member

    var body: some View {
        
        HStack {
            member.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(member.first + " " + member.last)


            Spacer()
        }
    }
}

#Preview {
    MemberRow(member: members[0])
}
