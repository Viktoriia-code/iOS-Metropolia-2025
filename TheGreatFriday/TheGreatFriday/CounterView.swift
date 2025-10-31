//
//  CounterView.swift
//  TheGreatFriday
//
//  Created by Viktoriia Beloborodova on 31.10.2025.
//

import SwiftUI

struct CounterView: View {
    var c:Int
    var body: some View {
        Text("counter is: \(c)")
            .bold()
            .font(.title)
    }
}

#Preview {
    CounterView(c: 2)
}
