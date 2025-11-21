//
//  number_guessing_gameApp.swift
//  number-guessing-game
//
//  Created by Viktoriia Beloborodova on 21.11.2025.
//

import SwiftUI
import SwiftData


@main
struct NumberGuessingApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                GameView()
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller")
                    }
                HighScoresView()
                    .tabItem {
                        Label("Scores", systemImage: "list.number")
                    }
            }
        }
        .modelContainer(for: ScoreEntry.self)
    }
}
