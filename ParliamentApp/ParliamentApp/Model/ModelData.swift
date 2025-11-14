//
//  ModelData.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI
import Combine

class MemberData: ObservableObject {
    @Published var members: [Member] = []
    let viewModel = MembersViewModel()
    @Published var favorites: Set<Int> = [] // store personNumber of favorites
    
    func loadFromNetwork() {
        guard let url = URL(string: "https://users.metropolia.fi/~peterh/mps.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned from server")
                return
            }
            
            do {
                let decodedMembers = try JSONDecoder().decode([Member].self, from: data)
                DispatchQueue.main.async {
                    self.members = decodedMembers
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    init() {
        let saved = UserDefaults.standard.array(forKey: "favorites") as? [Int] ?? []
        self.favorites = Set(saved)
    }
    
    func toggleFavorite(member: Member) {
        if favorites.contains(member.personNumber) {
            favorites.remove(member.personNumber)
        } else {
            favorites.insert(member.personNumber)
        }
    }

    func isFavorite(member: Member) -> Bool {
        print(favorites)
        return favorites.contains(member.personNumber)
    }
}
