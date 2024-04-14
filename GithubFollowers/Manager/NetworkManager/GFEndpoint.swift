//
//  GFEndpoint.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import Foundation

enum Endpoint {
    case getUserInfo(String)
    case getUserFollowers(String)
}

extension Endpoint {
    static let baseUrl = "https://api.github.com/users/"
    
    var path: String {
        switch self {
        case .getUserInfo(let username):
            return "\(username)"
        case .getUserFollowers(let username):
            return "\(username)/followers"
        }
    }
    
    var url: URL? {
        guard let fullURL = URL(string: Endpoint.baseUrl + path) else {
            return nil
        }
        return fullURL
    }
}

