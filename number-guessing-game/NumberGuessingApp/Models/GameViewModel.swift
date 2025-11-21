//
//  GameViewModel.swift
//  number-guessing-game
//
//  Created by Viktoriia Beloborodova on 21.11.2025.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var game = Game()
    @Published var currentGuess: Int = 1
    @Published var resultMessage: String = ""
    @Published var isFinished = false
    @Published var attempts = 0
    
    func submitGuess() {
        let outcome = game.makeGuess(guess: currentGuess)
        attempts += 1
        
        switch outcome {
        case .Low:
            resultMessage = "Too low"
        case .High:
            resultMessage = "Too high"
        case .Hit:
            resultMessage = "Correct"
            isFinished = true
        }
    }
    
    func restart() {
        game = Game()
        currentGuess = game.low
        resultMessage = ""
        isFinished = false
        attempts = 0
    }
}
