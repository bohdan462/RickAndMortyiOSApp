//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/18/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }

}
