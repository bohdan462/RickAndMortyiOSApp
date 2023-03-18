//
//  RMEpisodes.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
