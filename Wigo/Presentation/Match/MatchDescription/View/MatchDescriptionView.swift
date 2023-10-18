//
//  MatchDescriptionView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol MatchDescriptionViewDelegate: AnyObject {
    func didTapBackButton()
}

final class MatchDescriptionView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let backButtonSize: CGSize = .init(width: 36.0, height: 36.0)
        static let backButtonTopSpace: CGFloat = 16.0
        static let backButtonLeadingSpace: CGFloat = 16.0
    }
    
    // MARK: - Public properties
    
    weak var delegate: MatchDescriptionViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let backButton: UIButton = .init()
    
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
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
    
    private func configureLayouts() {
        addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.backButtonTopSpace),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.backButtonLeadingSpace),
            backButton.widthAnchor.constraint(equalToConstant: Constants.backButtonSize.width),
            backButton.heightAnchor.constraint(equalToConstant: Constants.backButtonSize.height)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension MatchDescriptionView {}
