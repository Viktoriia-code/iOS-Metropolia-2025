//
//  MemberList.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI

struct MemberList: View {
    @EnvironmentObject var data: MemberData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(data.members) { member in
                    NavigationLink {
                        MemberDetail(member: member, viewModel: data.viewModel)
                    } label: {
                        MemberRow(member: member, viewModel: data.viewModel)
                    }
                }
            }
            .navigationTitle("Members")
            .onAppear {
                data.loadFromNetwork()
            }
        } detail: {
            Text("Select a Member")
        }
    }
}

#Preview {
    MemberList()
        .environmentObject(MemberData())
}
