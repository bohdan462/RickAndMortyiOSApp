//
//  RMService.swift
//  RickAndMorty
//
//  Created by Bohdan Tkachenko on 3/17/23.
//

import Foundation


/// Primary API Service Object to get Rick and Morty data
final class RMService {
    ///Shared singelton instance
    static let shared = RMService()
    
    private let cacheManager = RMAPICacheManager()
    
    
    ///Privatized constructor
    private init() {
        
    }
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - type: Request instance
    ///   - complition: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    complition: @escaping (Result<T, Error>) -> Void
    ) {
        //USING CACHE
        if let cachedData = cacheManager.cacheResponse(for: request.endpoint, url: request.url) {
            do {
                let result = try JSONDecoder().decode(type.self, from: cachedData)
                complition(.success(result))
            }
            catch {
                complition(.failure(error))
            }
            return
        }
        guard let urlRequest = self.request(from: request) else {
            complition(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        //IF NOT CACHED
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { [weak self] data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            //Decode data
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                self?.cacheManager.setCache(for: request.endpoint, url: request.url, data: data)
                complition(.success(result))
            }
            catch {
                complition(.failure(error))
            }
        })
        task.resume()
    }
    
    //MARK: Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
    
    
}
