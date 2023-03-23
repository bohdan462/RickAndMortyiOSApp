//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import Foundation

/// Represents unique API enpoints
@frozen enum RMEndpoint: String, Hashable, CaseIterable {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location
    case location
    /// Endpoint to get episode info
    case episode
}
