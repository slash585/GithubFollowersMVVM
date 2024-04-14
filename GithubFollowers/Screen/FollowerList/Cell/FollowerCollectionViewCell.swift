//
//  FollowerCollectionViewCell.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import UIKit
import Kingfisher
import SnapKit

class FollowerCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCollectionViewCell"
    
    private let placeholderImage = UIImage(named: "avatar-placeholder")
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = placeholderImage
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        makeImageView()
        makeTitleLabel()
    }
    
    private func makeImageView(){
        addSubview(avatarImageView)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.width.height.equalTo(avatarImageView.snp.width)
        }
    }
    
    private func makeTitleLabel(){
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(20)
        }
    }
    
    func set(name: String, imageUrl: String){
        guard let imageUrl = URL(string: imageUrl) else { return }
        titleLabel.text = name
        avatarImageView.kf.setImage(with: imageUrl)
    }
}
