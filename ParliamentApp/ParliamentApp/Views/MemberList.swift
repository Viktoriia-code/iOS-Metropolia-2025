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
    //@EnvironmentObject var data: MemberData
    @Environment(\.modelContext) private var context
    
    @State private var selectedParty: String = "All"
    
    var allParties: [String] {
        let partiesSet = Set(members.map { $0.party.uppercased() })
        return ["All"] + Array(partiesSet).sorted()
    }

    var filteredMembers: [Member] {
        if selectedParty == "All" {
            return members
        }
        return members.filter { $0.party.uppercased() == selectedParty }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        if selectedParty == "All" {
                            Text("\(members.count) members in total")
                                .font(.headline)
                        } else {
                            Text("\(filteredMembers.count) members in \(selectedParty)")
                                .font(.headline)
                        }
                        
                        Spacer()
                        
                        Picker("", selection: $selectedParty) {
                            ForEach(allParties, id: \.self) { party in
                                Text(party).tag(party)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(maxWidth: 100)
                    }
                    
                    if selectedParty != "All" {
                        Text(filteredMembers.count > 100 ? "\(selectedParty) can form a majority government ✅" : "\(selectedParty) cannot form a majority government ❌")
                            .font(.subheadline)
                            .foregroundColor(filteredMembers.count > 100 ? .green : .red)
                    }
                }
                
                ForEach(filteredMembers) { member in
                    NavigationLink {
                        MemberDetail(member: member)
                    } label: {
                        MemberRow(member: member)
                    }
                }
            }
            .navigationTitle("Members")
            .task {
                // Log current database content
                print("Database contains \(members.count) members at launch")

                // Load from network if empty
                if members.isEmpty {
                    await loadFromNetwork()
                    print("Loaded members from network and saved to database")
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
