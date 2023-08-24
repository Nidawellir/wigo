//
//  OnboardingView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func didTapView()
}

final class OnboardingView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    weak var delegate: OnboardingViewDelegate?
    
    // MARK: - UI properties
    
    private let imageView: UIImageView = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTapScene))
        addGestureRecognizer(tap)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapScene() {
        delegate?.didTapView()
        
    }
    
    private func configureLayouts() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
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

extension OnboardingView {
    func set(image: UIImage?) {
        self.imageView.image = image
    }
}
