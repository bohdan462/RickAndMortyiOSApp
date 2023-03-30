//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/30/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {
    let id = UUID()
    
    //MARK: - Init
    
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
    
    //MARK: - Public
    public let type: RMSettingsOption
    
    public let onTapHandler: (RMSettingsOption) -> Void
    
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
