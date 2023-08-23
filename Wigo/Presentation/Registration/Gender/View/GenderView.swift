//
//  GendereView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol GendereViewDelegate: AnyObject {
    func didTapContinueButton(with gender: String)
}

final class GendereView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: GendereViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let scrolView: UIScrollView = .init()
    private let contentView: UIView = .init()
    private let backButton: UIButton = .init()
    private let titleLabel: UILabel = .init()
    private let nameTitleLabel: UILabel = .init()
    private let manGenderButton: GenderButton = .init(title: "Мужчина")
    private let womanGenderButton: GenderButton = .init(title: "Женщина")
    private let continueButton: ContinueButton = .init(title: "Продолжить")
    
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
        
        nameTitleLabel.text = "Я"
        nameTitleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        nameTitleLabel.textColor = Colors.CreateAccount.whiteColor.color
        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        manGenderButton.isEnabled = true
        manGenderButton.addTarget(self, action: #selector(didTapManGenderButton), for: .touchUpInside)
        manGenderButton.translatesAutoresizingMaskIntoConstraints = false
        
        womanGenderButton.isEnabled = true
        womanGenderButton.addTarget(self, action: #selector(didTapWomanGenderButton), for: .touchUpInside)
        womanGenderButton.translatesAutoresizingMaskIntoConstraints = false
        
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        continueButton.isEnabled = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapManGenderButton() {
        manGenderButton.isEnabled = false
        womanGenderButton.isEnabled = true
        continueButton.isEnabled = true
    }
    
    @objc
    private func didTapWomanGenderButton() {
        manGenderButton.isEnabled = true
        womanGenderButton.isEnabled = false
        continueButton.isEnabled = true
    }
    
    @objc
    private func didTapContinueButton() {
        if manGenderButton.isEnabled == false {
            delegate?.didTapContinueButton(with: "Мужчина")
        } else {
            delegate?.didTapContinueButton(with: "Женщина")
        }
    }
    
    private func configureLayouts() {
        addSubview(scrolView)
        
        scrolView.addSubview(contentView)
        
        contentView.addSubview(backButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(nameTitleLabel)
        contentView.addSubview(manGenderButton)
        contentView.addSubview(womanGenderButton)
        contentView.addSubview(continueButton)
        
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
            
            nameTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            nameTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            nameTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
            
            manGenderButton.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 40),
            manGenderButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 60),
            manGenderButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -60),
            manGenderButton.heightAnchor.constraint(equalToConstant: 46),
            
            womanGenderButton.topAnchor.constraint(equalTo: manGenderButton.bottomAnchor, constant: 16),
            womanGenderButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 60),
            womanGenderButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -60),
            womanGenderButton.heightAnchor.constraint(equalToConstant: 46),
            
            continueButton.topAnchor.constraint(equalTo: womanGenderButton.bottomAnchor, constant: 100),
            continueButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            continueButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            continueButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -300),
            continueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension GendereView {}
