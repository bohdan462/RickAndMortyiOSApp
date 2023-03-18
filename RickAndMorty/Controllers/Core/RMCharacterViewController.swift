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
        
        let request = RMRequest(
            endpoint: .character)
        
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self, complition: { result in
           
            
        })
    }
 

}
