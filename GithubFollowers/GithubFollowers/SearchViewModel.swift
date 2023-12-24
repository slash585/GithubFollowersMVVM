//
//  SearchViewModel.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 24.12.2023.
//

import Foundation

protocol SearchViewModelInterface {
    var view: SearchVCInterface? { get set }
}

final class SearchViewModel: SearchViewModelInterface {
    var view: SearchVCInterface?
}
