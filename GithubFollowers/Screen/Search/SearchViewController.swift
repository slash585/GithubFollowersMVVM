//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {}

final class SearchViewController: UIViewController {
    
    private lazy var viewModel = SearchViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .systemMint
    }
}

extension SearchViewController: SearchViewControllerProtocol {}

