//
//  MemberList.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI

struct MemberList: View {
    @EnvironmentObject var data: MemberData
    
    @State private var showFavoritesOnly = false

    var filteredMembers: [Member] {

        data.members.filter { member in
            !showFavoritesOnly || data.isFavorite(member: member)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredMembers) { member in
                    NavigationLink {
                        MemberDetail(member: member, viewModel: data.viewModel)
                    } label: {
                        MemberRow(member: member, viewModel: data.viewModel)
                    }
                }
            }
            .animation(.default, value: filteredMembers)
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
