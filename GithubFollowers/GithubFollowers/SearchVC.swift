//
//  SearchVC.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 24.12.2023.
//

import UIKit

protocol SearchVCInterface: AnyObject {
    
}

final class SearchVC: UIViewController {
    
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
    }
}

extension SearchVC: SearchVCInterface {
    
}
