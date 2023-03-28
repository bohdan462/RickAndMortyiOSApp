//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/23/23.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    private var dataTupel: (episode: RMEpisode, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum SectionType {
        case information(viewModel: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
    }
    
   public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []
    
    //MARK: - Init
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    public func character(at index: Int) -> RMCharacter? {
        guard let dataTupel = dataTupel else {
            return nil
        }
        return dataTupel.characters[index]
    }
    
    //MARK: - Private
    
    private func createCellViewModels() {
        guard let dataTupel = dataTupel else {
            return
        }

        let episode = dataTupel.episode
        let characters = dataTupel.characters
        
        var createdString = episode.created
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(from: episode.created) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date) 
        }
        
        cellViewModels = [
            .information(viewModel: [
                .init(title: "Episode Name", value: episode.name ),
                .init(title: "Air Date", value: episode.air_date ),
                .init(title: "Episode", value: episode.episode ),
                .init(title: "Created", value: createdString ),
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(characterName: character.name,
                                                              characterStatus: character.status,
                                                              characterImageUrl: URL(string: character.image))
            }))
        ]
    }
    
    ///Fetch backing episode model
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMEpisode.self, complition: { [weak self] result in
            switch result {
            case .success(let model):
               
                self?.fetchRelatedCharacters(episode: model)
            case .failure:
                break
            }
        })
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let characterUrls = episode.characters.compactMap({
            return URL(string: $0)
        })
        let requests: [RMRequest] = characterUrls.compactMap({
            return RMRequest(url: $0)
        })
        // Cick of parallel requests with Dispatch Groups
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for requst in requests {
            group.enter() // increment operation +1
            RMService.shared.execute(requst, expecting: RMCharacter.self, complition: { result in
                defer {
                    group.leave() //decrements number of times
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
                
            })
        }
        
        //Notify once all done
        group.notify(queue: .main) {
            self.dataTupel = (episode: episode, characters: characters)
        }
    }
}
