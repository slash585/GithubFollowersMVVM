//
//  MainTabbarController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import UIKit

final class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabbar()
    }
    
    private func createTabbar(){
        let searchVC = SearchViewController()
        let favoritesVC = FavoritesViewController()

        searchVC.navigationItem.largeTitleDisplayMode = .automatic
        favoritesVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: searchVC)
        let nav2 = UINavigationController(rootViewController: favoritesVC)

        nav1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        nav2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        
        for nav in [nav1, nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        UITabBar.appearance().tintColor = .systemGreen

        setViewControllers(
            [nav1, nav2],
            animated: true
        )
    }
}
