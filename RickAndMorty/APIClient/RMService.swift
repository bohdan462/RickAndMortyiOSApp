//
//  RMService.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import Foundation


/// Primary API Service Object to get Rick and Morty data
final class RMService {
    ///Shared singelton instance
    static let shared = RMService()
    ///Privatized constructor
    private init() {
        
    }
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - complition: Callback with data or error
    public func execute(_ request: RMRequest, complition: @escaping () -> Void) {
        
    }
    
    
    
}
