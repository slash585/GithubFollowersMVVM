//
//  UserDetailViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 15.04.2024.
//

import UIKit

protocol UserDetailViewControllerProtocol: AnyObject {
    
}

final class UserDetailViewController: UIViewController {
    
    private lazy var viewModel = UserDetailViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        doneButton.tintColor = .systemGreen
                navigationItem.rightBarButtonItem = doneButton
    }
    
    func set(username: String){
        viewModel.fetchUser(username: username)
    }
    
    @objc private func dismissVC(){
        dismiss(animated: true)
    }
}

extension UserDetailViewController: UserDetailViewControllerProtocol {
    
}
