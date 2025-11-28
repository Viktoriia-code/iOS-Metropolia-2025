//
//  HighScoresView.swift
//  number-guessing-game
//
//  Created by Viktoriia Beloborodova on 21.11.2025.
//

import SwiftUI
import SwiftData

struct HighScoresView: View {
    @Query(sort: \ScoreEntry.attempts, order: .forward) private var entries: [ScoreEntry]
    @State private var selectedName = ""
    
    var playerNames: [String] {
        Array(Set(entries.map { $0.playerName })).sorted()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.4, green: 0.7, blue: 1.0),
                    Color(red: 0.7, green: 0.9, blue: 1.0)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack(spacing: 24) {
                Text("Top five overall")
                    .font(.title2)
                
                List(topFive(entries)) { entry in
                    HStack {
                        Text(entry.playerName)
                        Spacer()
                        Text("\(entry.attempts)")
                    }
                }
                
                Picker("Player", selection: $selectedName) {
                    ForEach(playerNames, id: \.self) { name in
                        Text(name)
                    }
                }
                .pickerStyle(.menu)
                .onAppear {
                    if selectedName.isEmpty, let first = playerNames.first {
                        selectedName = first
                    }
                }
                
                Text("Top five for \(selectedName)")
                    .font(.title3)
                
                List(topFive(entries.filter { $0.playerName == selectedName })) { entry in
                    HStack {
                        Text(entry.playerName)
                        Spacer()
                        Text(entry.date.formatted(date: .numeric, time: .shortened))
                        Spacer()
                        Text("\(entry.attempts)")
                    }
                }
            }
            .padding()
        }
    }
    
    private func topFive(_ list: [ScoreEntry]) -> [ScoreEntry] {
        Array(list.prefix(5))
    }
}
