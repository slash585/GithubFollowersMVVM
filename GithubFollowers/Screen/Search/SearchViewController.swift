//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
            
    private lazy var githubImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "gh-logo")
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search a username..."
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .secondarySystemBackground
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Let's go", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleTappedSearchButton), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 22)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        makeImageView()
        makeSearchTextField()
        makeSearchButton()
    }
    
    private func makeImageView(){
        view.addSubview(githubImageView)
        
        githubImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func makeSearchTextField(){
        view.addSubview(searchTextField)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(githubImageView.snp.bottom).offset(64)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(50)
        }
    }
    
    private func makeSearchButton(){
        view.addSubview(searchButton)
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(50)
        }
    }
    
    @objc private func handleTappedSearchButton(){
        guard let username = searchTextField.text else { return }
        let vc = FollowerListViewController()
        vc.title = username
        vc.set(username: username)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

