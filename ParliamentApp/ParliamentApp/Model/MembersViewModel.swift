//
//  MembersViewModel.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import Foundation

class MembersViewModel: ObservableObject {
    @Published var members: [Member] = []
}

