//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episodes: [String]
    let url: String
    let created: String
    
}


