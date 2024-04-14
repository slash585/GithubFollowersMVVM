//
//  GFService.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import Foundation

protocol GFServiceProtocol {
    func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, GFNetworkError>) -> Void) where T : Codable
}

final class GFService: GFServiceProtocol {
    static let shared = GFService()
    
    func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, GFNetworkError>) -> Void) where T : Codable {
        guard let url = endpoint.url else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidUsername))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
