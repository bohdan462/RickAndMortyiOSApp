//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/23/23.
//

import UIKit


///Configurable controller to search
final class RMSearchViewController: UIViewController {
    
    struct Config {
        enum `Type` {
            case character
            case episode
            case location
        }
        
        let type: `Type`
    }
    
    private let cofig: Config
    
    init(config: Config) {
        self.cofig = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
       
    }
    

}
