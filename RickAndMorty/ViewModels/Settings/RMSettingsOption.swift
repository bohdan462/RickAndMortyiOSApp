//
//  RMSettingsOption.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/30/23.
//

import UIKit
enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReferance
    case viewSeries
    case viewCode
    
    var targetUrl: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://rickandmortyapi.com/support-us")
        case .terms:
            return URL(string: "https://rickandmortyapi.com/about")
        case .privacy:
            return URL(string: "https://rickandmortyapi.com/about")
        case .apiReferance:
            return URL(string: "https://rickandmortyapi.com/documentation")
        case .viewSeries:
            return URL(string: "https://www.adultswim.com/videos/rick-and-morty")
        case .viewCode:
            return URL(string: "https://github.com/bohdan462/RickAndMortyiOSApp")
        }
    }
    
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReferance:
            return  "API Referance"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemMint
        case .contactUs:
            return .systemRed
        case .terms:
            return .systemBlue
        case .privacy:
            return .systemCyan
        case .apiReferance:
            return .systemGray
        case .viewSeries:
            return .systemPink
        case .viewCode:
            return .systemBrown
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReferance:
            return UIImage(systemName: "list.clipboard")
        case .viewSeries:
            return UIImage(systemName: "tv.fill")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}
