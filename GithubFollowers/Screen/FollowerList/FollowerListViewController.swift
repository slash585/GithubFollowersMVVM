//
//  FollowerListViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import UIKit
import SnapKit

protocol FollowerListViewControllerProtocol: AnyObject {
    func prepareColletionView()
    func reloadData()
    func startIndicatorAnimating()
    func stopIndicatorAnimating()
}

final class FollowerListViewController: UIViewController {
    
    private lazy var viewModel = FollowerListViewModel(view: self)
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelpers.createThreeColumnFlowLayout(in: view))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
        return collectionView
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
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
        makeIndicator()
    }
    
    private func makeIndicator(){
        view.addSubview(indicator)
        
        indicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    func set(username: String){
        viewModel.fetchFollowers(username: username)
    }
}

extension FollowerListViewController: FollowerListViewControllerProtocol {
    func startIndicatorAnimating() {
        DispatchQueue.main.async {
            self.indicator.startAnimating()
        }
    }
    
    func stopIndicatorAnimating() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
    }
    
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func prepareColletionView() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    
    }
}

extension FollowerListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as! FollowerCollectionViewCell
        cell.set(name: viewModel.followers[indexPath.item].login, imageUrl: viewModel.followers[indexPath.item].avatarUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UserDetailViewController()
        let navigationController = UINavigationController(rootViewController: UserDetailViewController())
        vc.set(username: viewModel.followers[indexPath.item].login)
        present(navigationController, animated: true)
    }
}
