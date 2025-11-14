//
//  ParliamentAppApp.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 31.10.2025.
//

import SwiftUI

@main
struct ParliamentApp: App {
    @StateObject private var memberData = MemberData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(memberData)
        }
    }
}
