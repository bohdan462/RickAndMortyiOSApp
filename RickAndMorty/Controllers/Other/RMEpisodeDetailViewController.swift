//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/23/23.
//

import UIKit

///VC  to show detail about single episode
final class RMEpisodeDetailViewController: UIViewController {
    
    private let url: URL?
    
    //MARK: Init
    
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemBackground
    }
    

}
