//
//  MemberList.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI
import SwiftData

struct MemberList: View {
    @Query private var members: [Member]
    @EnvironmentObject var data: MemberData
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(members) { member in
                    NavigationLink {
                        MemberDetail(member: member)
                    } label: {
                        MemberRow(member: member)
                    }
                }
            }
            .navigationTitle("Members")
            .task {
                // Load members only if DB is empty
                if members.isEmpty {
                    await loadFromNetwork()
                }
            }
        } detail: {
            Text("Select a Member")
        }
    }
    
    func loadFromNetwork() async {
        guard let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([MemberDTO].self, from: data)

            // Remove old data (optional)
            try context.delete(model: Member.self)

            // Insert new members
            for dto in decoded {
                let member = Member(
                    personNumber: dto.personNumber,
                    seatNumber: dto.seatNumber,
                    last: dto.last,
                    first: dto.first,
                    party: dto.party,
                    minister: dto.minister,
                    picture: dto.picture,
                    twitter: dto.twitter ?? "",
                    bornYear: dto.bornYear,
                    constituency: dto.constituency,
                    favorite: false,
                    note: ""
                )
                context.insert(member)
            }

            try context.save()

        } catch {
            print("Network error: \(error)")
        }
    }
}

#Preview {
    MemberList()
        .modelContainer(
            try! ModelContainer(for: Member.self)
        )
}
