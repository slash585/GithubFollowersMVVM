//
//  Extension+UIFont.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 24.12.2023.
//

import UIKit

extension UIFont {
    var boldVersion: UIFont {
        guard let desctiptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }
        
        return UIFont(descriptor: desctiptor, size: .zero) /// Zero is keep the original size
    }
}
