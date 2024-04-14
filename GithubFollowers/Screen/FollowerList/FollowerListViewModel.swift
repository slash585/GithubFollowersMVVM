//
//  FollowerListViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import Foundation

protocol FollowerListViewModelProtocol {
    var followers: [Follower] { get set }
    
    func fetchFollowers(username: String)
}

final class FollowerListViewModel: FollowerListViewModelProtocol {
    private weak var view: FollowerListViewControllerProtocol?
    
    var followers: [Follower] = [] {
        didSet {
            view?.reloadData()
        }
    }
    
    
    init(view: FollowerListViewControllerProtocol?) {
        self.view = view
    }
    
    func fetchFollowers(username: String) {
        view?.startIndicatorAnimating()

        GFService.shared.request(endpoint: .getUserFollowers(username)) { [weak self] (result: Result<[Follower], GFNetworkError>) in
            
            guard let self else { return }
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.followers = model
                    self.view?.prepareColletionView()
                    self.view?.stopIndicatorAnimating()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                    self.view?.stopIndicatorAnimating()
                }
            }
        }
    }
}
