//
//  Theme.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 24.12.2023.
//

import UIKit

struct Theme {
    let primaryColor: UIColor
    let secondaryColor: UIColor
    let headlineFont: UIFont
    let bodyFont: UIFont
}

extension Theme {
    static var defaultTheme: Theme {
        return Theme(
            primaryColor: .systemBlue,
            secondaryColor: .systemGreen,
            headlineFont: .systemFont(ofSize: FontSize.headline),
            bodyFont: .systemFont(ofSize: FontSize.body)
        )
    }
}
