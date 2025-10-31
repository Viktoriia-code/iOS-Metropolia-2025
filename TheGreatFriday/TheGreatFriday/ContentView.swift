//
//  ContentView.swift
//  TheGreatFriday
//
//  Created by Viktoriia Beloborodova on 31.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            CounterView(c: counter)
        }
        .padding()
        CounterOperations(c: $counter)
        /* Button("Click") {
            counter += 2
            print("counter = \(counter)")
        }*/
    }
}

#Preview {
    ContentView(counter: 0)
}
