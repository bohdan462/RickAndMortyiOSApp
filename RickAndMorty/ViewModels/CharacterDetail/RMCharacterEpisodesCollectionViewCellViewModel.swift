//
//  RMCharacterEpisodesCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/22/23.
//

import Foundation

protocol RMEpisodeDataRender {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class RMCharacterEpisodesCollectionViewCellViewModel {
    
    let episodeDataUrl: URL?
    private var isFetching = false
    private var dataBlock: ((RMEpisodeDataRender) -> Void)?
    
    private var episode: RMEpisode? {
        didSet {
            guard let model = episode else {
                return
            }
            dataBlock?(model)
    }
        
    }
    
    //MARK: - Init
    
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
    
    //MARK: - Public
    public func fetchEpisode() {
        
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        guard let url = episodeDataUrl, let rmRequest = RMRequest(url: url) else {
            return
        }
        isFetching = true
        RMService.shared.execute(rmRequest, expecting: RMEpisode.self, complition: { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        })
    }
    
    public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> Void) {
        self.dataBlock = block
    }
    
}
