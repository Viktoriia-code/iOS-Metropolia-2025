//
//  MemberDTO.swift
//  ParliamentApp
//
//  Created by Viktoriia Beloborodova on 14.11.2025.
//

import Foundation

struct MemberDTO: Codable {
    let personNumber: Int
    let seatNumber: Int
    let last: String
    let first: String
    let party: String
    let minister: Bool
    let picture: String
    let twitter: String?
    let bornYear: Int
    let constituency: String
    let favorite: Bool?
    let note: String?
}
