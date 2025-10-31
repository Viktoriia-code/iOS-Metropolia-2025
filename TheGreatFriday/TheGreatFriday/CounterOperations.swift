//
//  CounterOperations.swift
//  TheGreatFriday
//
//  Created by Viktoriia Beloborodova on 31.10.2025.
//

import SwiftUI

struct CounterOperations: View {
    @Binding var c: Int

    var body: some View {
        HStack {
            Button("-") {
                c -= 1
            }
            .padding() // Adds default padding around the button
            .background(Color.red) // Sets the background color
            .foregroundColor(.white) // Changes the text color
            .cornerRadius(8) // Rounds the corners
            
            Button("Reset") {
                c = 0
            }
            .padding() // Adds default padding around the button
            .background(Color.gray) // Sets the background color
            .foregroundColor(.white) // Changes the text color
            .cornerRadius(8) // Rounds the corners
            
            Button("+") {
                c += 1
            }
            .padding() // Adds default padding around the button
            .background(Color.green) // Sets the background color
            .foregroundColor(.white) // Changes the text color
            .cornerRadius(8) // Rounds the corners
            
        }
    }
}

#Preview {
    //CounterOperations(c: 1)
}
