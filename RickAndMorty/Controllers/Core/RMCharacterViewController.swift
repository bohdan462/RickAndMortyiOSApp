//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import UIKit

/// Controller to show and search Character
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Characters"
        
        
        RMService.shared.execute(.listCharactersRequests,
                                 expecting: RMGetAllCharactersResponse.self,
                                 complition: { result in
            
            switch result {
            case .success(let model):
                print("Total: \(model.results.count)")
                print("Total info: \(model.info.pages)")
            case .failure(let error):
                String(describing: error)
            }
            
        })
    }
 

}
