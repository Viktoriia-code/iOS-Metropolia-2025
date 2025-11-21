//
//  GameView.swift
//  number-guessing-game
//
//  Created by Viktoriia Beloborodova on 21.11.2025.
//

import SwiftUI
import SwiftData

struct GameView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = GameViewModel()
    @State private var showNamePrompt = false
    @State private var playerName = ""
    
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
                Text("Guess the number")
                    .font(.title)
                    .foregroundColor(.white)
                
                Slider(
                    value: Binding(
                        get: { Double(viewModel.currentGuess) },
                        set: { viewModel.currentGuess = Int($0) }
                    ),
                    in: Double(viewModel.game.low)...Double(viewModel.game.high),
                    step: 1
                )
                .padding()
                
                Text("Your guess: \(viewModel.currentGuess)")
                    .foregroundColor(.white)
                
                Button {
                    viewModel.submitGuess()
                    if viewModel.isFinished {
                        showNamePrompt = true
                    }
                } label: {
                    Text("Submit")
                        .font(.title2)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Text(viewModel.resultMessage)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(minHeight: 30, alignment: .center)
            }
        }
        .sheet(isPresented: $showNamePrompt) {
            VStack(spacing: 20) {
                Text("🎉")
                    .font(.system(size: 80))
                
                Text("You needed \(viewModel.attempts) attempts")
                    .font(.title2)
                
                TextField("Enter your name", text: $playerName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Button("Save score") {
                    let entry = ScoreEntry(playerName: playerName, attempts: viewModel.attempts)
                    context.insert(entry)
                    try? context.save()
                    viewModel.restart()
                    showNamePrompt = false
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
            .padding()
        }
    }

    
    private var sampleNames: [String] {
        ["Alex", "Sam", "Lina", "Mira", "Kai", "Rin", "Joss"]
    }
}
