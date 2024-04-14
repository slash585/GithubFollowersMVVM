//
//  SearchViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import Foundation

protocol SearchViewModelProtocol {
    
}

final class SearchViewModel: SearchViewModelProtocol {
    private weak var view: SearchViewControllerProtocol?
    
    init(view: SearchViewControllerProtocol?) {
        self.view = view
    }
}
