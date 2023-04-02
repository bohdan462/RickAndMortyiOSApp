//
//  RMLocationDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 4/1/23.
//

import Foundation

protocol RMLocationDetailViewViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

class RMLocationDetailViewViewModel {
    
    private let endpointUrl: URL?
    private var dataTupel: (location: RMLocation, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchLocationDetails()
        }
    }
    
    enum SectionType {
        case information(viewModel: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: RMLocationDetailViewViewModelDelegate?
    
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
        
        let location = dataTupel.location
        let characters = dataTupel.characters
        
        var createdString = location.created
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(from: location.created) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date)
        }
        
        cellViewModels = [
            .information(viewModel: [
                .init(title: "Location Name", value: location.name ),
                .init(title: "Type", value: location.type ),
                .init(title: "Dimension", value: location.dimension ),
                .init(title: "Created", value: createdString ),
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(characterName: character.name,
                                                              characterStatus: character.status,
                                                              characterImageUrl: URL(string: character.image))
            }))
        ]
    }
    
    ///Fetch backing location model
    public func fetchLocationData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMLocation.self, complition: { [weak self] result in
            switch result {
            case .success(let model):
                
                self?.fetchRelatedCharacters(location: model)
            case .failure:
                break
            }
        })
    }
    
    private func fetchRelatedCharacters(location: RMLocation) {
        let characterUrls = location.residents.compactMap({
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
            self.dataTupel = (location: location, characters: characters)
        }
    }
}

