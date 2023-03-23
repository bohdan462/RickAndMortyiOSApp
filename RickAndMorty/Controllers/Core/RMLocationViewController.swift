//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import UIKit

/// Controller to show and search Locations
final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        title = "Location"
        addSerachButton()
    }
    
    private func addSerachButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didtapSearch))
    }
    
    @objc
    private func didtapSearch() {
        
    }
   

}
