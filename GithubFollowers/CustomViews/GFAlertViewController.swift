//
//  GFAlertViewController.swift
//  GithubFollowers
//
//  Created by Mehmet Ali Özdemir on 14.04.2024.
//

import UIKit
import SnapKit

final class GFAlertViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(handleTappedActionButton), for: .touchUpInside)
        return button
    }()
    
    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    init(alertTitle: String?, message: String?, buttonTitle: String?) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        makeContainerView()
    }
    
    private func makeContainerView(){
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(220)
            make.width.equalTo(280)
        }
        
        makeTitleLabel()
        makeBodyLabel()
        makeActionButton()
    }
    
    private func makeTitleLabel(){
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(20)
            make.left.equalTo(containerView.snp.left).offset(20)
            make.right.equalTo(containerView.snp.right).offset(-20)
            make.height.equalTo(28)
        }
    }
    
    private func makeBodyLabel(){
        containerView.addSubview(bodyLabel)
        bodyLabel.text = message ?? "Unable to complate request"
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(containerView.snp.left).offset(20)
            make.right.equalTo(containerView.snp.right).offset(-20)
            make.bottom.equalTo(containerView.snp.bottom).offset(-12)
        }
    }
    
    private func makeActionButton(){
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
            make.left.equalTo(containerView.snp.left).offset(20)
            make.right.equalTo(containerView.snp.right).offset(-20)
            make.height.equalTo(44)
        }
    }
    
    @objc private func handleTappedActionButton(){
        dismiss(animated: true)
    }
}
