//
//  MemberList.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI

struct MemberList: View {
    var body: some View {
        NavigationSplitView {
            List(members) { member in
                NavigationLink {
                    MemberDetail(member: member)
                } label: {
                    MemberRow(member: member)
                }
            }
            .navigationTitle("Members")
        } detail: {
            Text("Select a Member")
        }
    }
}

#Preview {
    MemberList()
}
