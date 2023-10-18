//
//  MatchDescriptionView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol MatchDescriptionViewDelegate: AnyObject {
    func didTapBackButton()
    func didTapThumbnailView()
}

final class MatchDescriptionView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let backButtonSize: CGSize = .init(width: 36.0, height: 36.0)
        static let backButtonTopSpace: CGFloat = 16.0
        static let backButtonLeadingSpace: CGFloat = 16.0
        static let thumbnailViewCornerRadius: CGFloat = 10.0
        static let thumbnailViewTopSpace: CGFloat = 24.0
        static let thumbnailViewLeadingSpace: CGFloat = 16.0
        static let thumbnailViewSize: CGSize = .init(width: 100, height: 160)
        static let playButtonSize: CGSize = .init(width: 28.0, height: 28.0)
    }
    
    // MARK: - Public properties
    
    weak var delegate: MatchDescriptionViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let backButton: UIButton = .init()
    private let thumbnailView: UIView = .init()
    private let thumbnailImageView: UIImageView = .init()
    private let playButton: UIButton = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        backButton.setImage(Images.Match.backButton.image, for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        thumbnailView.layer.cornerRadius = Constants.thumbnailViewCornerRadius
        thumbnailView.clipsToBounds = true
        thumbnailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapThumbnailView)))
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        
        thumbnailImageView.backgroundColor = .black
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        playButton.setImage(Images.Match.playButton.image, for: .normal)
        playButton.addTarget(self, action: #selector(didTapThumbnailView), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
    
    @objc
    private func didTapThumbnailView() {
        delegate?.didTapThumbnailView()
    }
    
    private func configureLayouts() {
        addSubview(backButton)
        addSubview(thumbnailView)
        
        thumbnailView.addSubview(thumbnailImageView)
        thumbnailView.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.backButtonTopSpace),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.backButtonLeadingSpace),
            backButton.widthAnchor.constraint(equalToConstant: Constants.backButtonSize.width),
            backButton.heightAnchor.constraint(equalToConstant: Constants.backButtonSize.height),
            
            thumbnailView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Constants.thumbnailViewTopSpace),
            thumbnailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.thumbnailViewLeadingSpace),
            thumbnailView.widthAnchor.constraint(equalToConstant: Constants.thumbnailViewSize.width),
            thumbnailView.heightAnchor.constraint(equalToConstant: Constants.thumbnailViewSize.height),
            
            thumbnailImageView.topAnchor.constraint(equalTo: thumbnailView.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: thumbnailView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: thumbnailView.trailingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: thumbnailView.bottomAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: thumbnailView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: thumbnailView.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: Constants.playButtonSize.width),
            playButton.heightAnchor.constraint(equalToConstant: Constants.playButtonSize.height),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension MatchDescriptionView {}
