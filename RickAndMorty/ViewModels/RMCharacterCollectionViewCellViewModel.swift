//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/18/23.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
    private let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
    public var characterNameText: String {
        return characterName
    }
    
    public var characterImage: URL? {
        return characterImageUrl
    }
    public func fetchImage(complition: @escaping (Result<Data, Error>) -> Void) {
        //TODO: ABSTRACT TO IMAGE_MANAGER
        guard let url = characterImageUrl else {
            complition(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            complition(.success(data))
        })
        task.resume()
    }
}
