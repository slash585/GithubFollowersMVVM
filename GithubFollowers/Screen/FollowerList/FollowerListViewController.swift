//
//  FollowerListViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import UIKit

final class FollowerListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
    }
    
    func set(username: String){
        print(username)
    }
}
