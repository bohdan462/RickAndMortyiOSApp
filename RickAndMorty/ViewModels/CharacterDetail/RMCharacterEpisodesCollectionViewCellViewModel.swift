//
//  RMCharacterEpisodesCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/22/23.
//

import Foundation

final class RMCharacterEpisodesCollectionViewCellViewModel {
    
    let episodeDataUrl: URL?
    
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}
