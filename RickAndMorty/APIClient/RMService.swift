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
        guard let urlRequest = self.request(from: request) else {
            complition(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _, error in
            print("url: \(urlRequest)")
            guard let data = data, error == nil else {
                complition(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            //Decode data
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                complition(.success(result))
            }
            catch {
                print("Error returning data: \(error)")
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
