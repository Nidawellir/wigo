//
//  SMSCodeView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class SMSCodeView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let scrolView: UIScrollView = .init()
    private let contentView: UIView = .init()
    private let backButton: UIButton = .init()
    private let titleLabel: UILabel = .init()
    private let codeTitleLabel: UILabel = .init()
    private let codeTextField: ConfirmationCodeInputView = .init(length: 6)
    private let codeТotСomeButton: UIButton = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        scrolView.showsVerticalScrollIndicator = false
        scrolView.backgroundColor = .clear
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setImage(Images.CreateAccount.backArrow.image, for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Создать аккаунт"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = Colors.CreateAccount.whiteColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        codeTitleLabel.text = "Введи код"
        codeTitleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        codeTitleLabel.textColor = Colors.CreateAccount.whiteColor.color
        codeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        codeTextField.backgroundColor = .clear
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedString = NSMutableAttributedString()

        attributedString.append(NSAttributedString(
            string: "Код не пришел? ",
            attributes: [.foregroundColor: Colors.CreateAccount.lightGrayTetxColor.color]
        ))
        attributedString.append(NSAttributedString(
            string: "Выслать еще раз",
            attributes: [.foregroundColor: Colors.CreateAccount.systemBlueTextColor.color]
        ))
        
        codeТotСomeButton.setAttributedTitle(attributedString, for: .normal)
        codeТotСomeButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        codeТotСomeButton.titleLabel?.numberOfLines = 0
        codeТotСomeButton.titleLabel?.textAlignment = .left
//        codeТotСomeButton.addTarget(self, action: #selector(didTapReulationsLabe), for: .touchUpInside)
        codeТotСomeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(scrolView)
        
        scrolView.addSubview(contentView)
        
        contentView.addSubview(backButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(codeTitleLabel)
        contentView.addSubview(codeTextField)
        contentView.addSubview(codeТotСomeButton)
        
        NSLayoutConstraint.activate([
            scrolView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrolView.leftAnchor.constraint(equalTo: leftAnchor),
            scrolView.rightAnchor.constraint(equalTo: rightAnchor),
            scrolView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            backButton.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 36),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 4),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -52),
            
            codeTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            codeTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            codeTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
            
            codeTextField.topAnchor.constraint(equalTo: codeTitleLabel.bottomAnchor, constant: 50),
            codeTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            codeТotСomeButton.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: 30),
            codeТotСomeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            codeТotСomeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
            codeТotСomeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension SMSCodeView {}
