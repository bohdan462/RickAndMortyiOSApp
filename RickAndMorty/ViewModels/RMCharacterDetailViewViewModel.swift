//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/18/23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
