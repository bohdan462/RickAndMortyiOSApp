//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/31/23.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    
    //Location response info
    //will contain next url if present
    
    private var cellViewModels: [String] = []
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequests, expecting: String.self, complition: { results in
            switch results {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        })
    }
    
    private var hasMoreResults: Bool {
        return false
    }
    
}
