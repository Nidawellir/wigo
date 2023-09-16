//
//  CustomNavigationBar.swift
//  Wigo
//
//  Created by Apple User on 8/31/23.
//

import UIKit

protocol CustomNavigationBarDelegate: AnyObject {
    func didTapAvatarButton()
    func didTapEventButton()
    func didTapFilterButton()
}

final class CustomNavigationBarView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: CustomNavigationBarDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let avatarButton: UIButton = .init()
    private let titleLabel: UILabel = .init()
    private let usernameLabel: UILabel = .init()
    private let addEventButton: UIButton = .init()
    private let filterButton: UIButton = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        avatarButton.setImage(Images.MainScrean.avatar.image, for: .normal)
        avatarButton.addTarget(self, action: #selector(didTapAvatarButton), for: .touchUpInside)
        avatarButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Привет,"
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        usernameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        usernameLabel.textColor = Colors.CreateAccount.whiteColor.color
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addEventButton.setImage(Images.MainScrean.addEventButton.image, for: .normal)
        addEventButton.addTarget(self, action: #selector(didTapEventButton), for: .touchUpInside)
        addEventButton.translatesAutoresizingMaskIntoConstraints = false
        
        filterButton.setImage(Images.MainScrean.filterButton.image, for: .normal)
        filterButton.addTarget(self, action: #selector(didTapFilterButton), for: .touchUpInside)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapAvatarButton() {
        delegate?.didTapAvatarButton()
    }
    
    @objc
    private func didTapEventButton() {
        delegate?.didTapEventButton()
    }
    
    @objc
    private func didTapFilterButton() {
        delegate?.didTapFilterButton()
    }
    
    
    private func configureLayouts() {
        addSubview(avatarButton)
        addSubview(titleLabel)
        addSubview(usernameLabel)
        addSubview(addEventButton)
        addSubview(filterButton)
        
        NSLayoutConstraint.activate([
            avatarButton.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            avatarButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatarButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            avatarButton.heightAnchor.constraint(equalToConstant: 48),
            avatarButton.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: avatarButton.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: avatarButton.rightAnchor, constant: 12),
            
            usernameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            usernameLabel.leftAnchor.constraint(equalTo: avatarButton.rightAnchor, constant: 12),
            
            addEventButton.centerYAnchor.constraint(equalTo: avatarButton.centerYAnchor),
            addEventButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            addEventButton.heightAnchor.constraint(equalToConstant: 36),
            addEventButton.widthAnchor.constraint(equalToConstant: 36),
            
            filterButton.centerYAnchor.constraint(equalTo: addEventButton.centerYAnchor),
            filterButton.rightAnchor.constraint(equalTo: addEventButton.leftAnchor, constant: -16),
            filterButton.heightAnchor.constraint(equalToConstant: 36),
            filterButton.widthAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension CustomNavigationBarView {
    func setName(name: String) {
        usernameLabel.text = name
    }
}
