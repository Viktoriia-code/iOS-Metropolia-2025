//
//  ScoreEntry.swift
//  number-guessing-game
//
//  Created by Viktoriia Beloborodova on 21.11.2025.
//

import Foundation
import SwiftData

@Model
class ScoreEntry {
    var playerName: String
    var attempts: Int
    var date: Date
    
    init(playerName: String, attempts: Int, date: Date = .now) {
        self.playerName = playerName
        self.attempts = attempts
        self.date = date
    }
}
