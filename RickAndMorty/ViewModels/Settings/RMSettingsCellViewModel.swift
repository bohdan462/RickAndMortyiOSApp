//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/30/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    private let type: RMSettingsOption
    
    //MARK: - Init
    
    init(type: RMSettingsOption) {
        self.type = type
    }
    
    //MARK: - Public
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
