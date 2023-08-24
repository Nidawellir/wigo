//
//  TurnNotificationsView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol TurnNotificationsViewDelegate: AnyObject {
    func didTapNotNow()
}

final class TurnNotificationsView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: TurnNotificationsViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let containerView: UIView = .init()
    private let imageView: UIImageView = .init()
    private let titleLabel: UILabel = .init()
    private let descriptionLabel: UILabel = .init()
    private let turnButton: ContinueButton = .init(title: "Включить")
    private let notNowLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = Images.CreateAccount.notification.image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Включи\n уведомления"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = Colors.CreateAccount.whiteColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "Уведомления позволят тебе всегда оставаться в центре событий."
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = Colors.CreateAccount.whiteColor.color
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        turnButton.addTarget(self, action: #selector(didTapTurnButton), for: .touchUpInside)
        turnButton.translatesAutoresizingMaskIntoConstraints = false
        
        notNowLabel.backgroundColor = .clear
        notNowLabel.text = "Не сейчас"
        notNowLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        notNowLabel.textColor = .white
        notNowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let gesture = UIGestureRecognizer(target: self, action: #selector(didTapNotNow))
        notNowLabel.addGestureRecognizer(gesture)
    }
    
    @objc
    private func didTapNotNow() {
        delegate?.didTapNotNow()
    }
    
    private func configureLayouts() {
        addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        addSubview(turnButton)
        addSubview(notNowLabel)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 52),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -52),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            turnButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 120),
            turnButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            turnButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            turnButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            turnButton.heightAnchor.constraint(equalToConstant: 58),
            
            notNowLabel.topAnchor.constraint(equalTo: turnButton.bottomAnchor, constant: 20),
            notNowLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension TurnNotificationsView {}
