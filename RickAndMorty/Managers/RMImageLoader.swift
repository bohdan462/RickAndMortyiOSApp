//
//  ImageLoader.swift
//  RMRickAndMorty
//
//  Created by Bohdan Tkachenko on 3/22/23.
//

import Foundation
final class RMImageLoader {
    static let shared = RMImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init() {}
    
    /// Get image content with URL
    /// - Parameters:
    ///   - url: source url
    ///   - complition: callback
    func downloadImage(_ url: URL, complition: @escaping (Result<Data, Error>) -> Void) {
            let key = url.absoluteString as NSString
           if let data = imageDataCache.object(forKey: key) {
            complition(.success(data as Data)) // NSData == Data
            return
        }
           
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            complition(.success(data))
        })
        task.resume()
    }
    
}
