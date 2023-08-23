//
//  FirstOnboardingView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class FirstOnboardingView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let imageView: UIImageView = .init(image: Images.CreateAccountOnboarding.first.image)
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .black
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension FirstOnboardingView {}
