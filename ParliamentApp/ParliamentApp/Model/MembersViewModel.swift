//
//  MembersViewModel.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import Foundation

class MembersViewModel: ObservableObject {
    @Published var members: [Member] = []
    @Published var favorites: Set<Int> = [] {
        didSet {
            saveFavorites()
        }
    }

    init() {
        loadFavorites()
    }

    func toggleFavorite(member: Member) {
        if favorites.contains(member.personNumber) {
            favorites.remove(member.personNumber)
        } else {
            favorites.insert(member.personNumber)
        }
    }

    func isFavorite(member: Member) -> Bool {
        favorites.contains(member.personNumber)
    }

    // MARK: - Persistence
    private func saveFavorites() {
        let array = Array(favorites)
        UserDefaults.standard.set(array, forKey: "favorites")
    }

    private func loadFavorites() {
        if let array = UserDefaults.standard.array(forKey: "favorites") as? [Int] {
            favorites = Set(array)
        }
    }
}

