//
//  ModelData.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 7.11.2025.
//

import SwiftUI
import Combine
import SwiftData

/*class MemberData: ObservableObject {
    let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func toggleFavorite(member: Member) {
        member.favorite.toggle()
        try? context.save() // persist change
    }
    
    func isFavorite(member: Member) -> Bool {
        return member.favorite
    }
    
    // Optional: fetch all favorites
    func fetchFavorites() -> [Member] {
        let request = FetchDescriptor<Member>(predicate: #Predicate { $0.favorite == true })
        return (try? context.fetch(request)) ?? []
    }
}*/
