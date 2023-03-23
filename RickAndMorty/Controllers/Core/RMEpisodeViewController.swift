//
//  RMEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import UIKit

/// Controller to show and search Episodes
final class RMEpisodeViewController: UIViewController, RMEpisodeListViewDelegate {

    private let episodeListView = RMEpisodeListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Episodes"
        setUpView()
        addSerachButton()
    }
 
    private func setUpView() {
       episodeListView.delegate = self
        view.addSubview(episodeListView)
        NSLayoutConstraint.activate([
            episodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            episodeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            episodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addSerachButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didtapSearch))
    }
    
    @objc
    private func didtapSearch() {
        
    }
    
    //MARK: -Delegate implementation
    
    func rmEpisodeListView(_ characterListView: RMEpisodeListView, didSelectEpisode episode: RMEpisode) {
        //Open detail controller for that episode
        let detailVC = RMEpisodeDetailViewController(url: URL(string: episode.url))
        navigationController?.pushViewController(detailVC, animated: true)
    }
    

   

}
