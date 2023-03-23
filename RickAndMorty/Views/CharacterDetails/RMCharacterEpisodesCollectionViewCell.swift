//
//  RMCharacterEpisodesCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/22/23.
//

import UIKit

final class RMCharacterEpisodesCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterEpisodesCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: RMCharacterEpisodesCollectionViewCellViewModel) {
        
    }
    
}
