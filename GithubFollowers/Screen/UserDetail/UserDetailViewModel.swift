//
//  UserDetailViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 15.04.2024.
//

import Foundation

protocol UserDetailViewModelProtocol {
    var user: User? { get set }
}

final class UserDetailViewModel: UserDetailViewModelProtocol {
    private weak var view: UserDetailViewControllerProtocol?
    
    var user: User?
    
    init(view: UserDetailViewControllerProtocol?) {
        self.view = view
    }
    
    func fetchUser(username: String) {
        GFService.shared.request(endpoint: .getUserInfo(username)) { [weak self] (result: Result<User, GFNetworkError>) in
            
            guard let self else { return }
            
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.user = model
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
