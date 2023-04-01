//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 4/1/23.
//

import UIKit

final class RMLocationTableViewCell: UITableViewCell {
static let cellIdentifier = "RMLocationTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
  
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: RMLocationTableViewCellViewModel) {
        
    }
}
