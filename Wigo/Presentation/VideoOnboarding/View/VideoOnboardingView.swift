//
//  VideoOnboardingView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol VideoOnboardingViewDelegate: AnyObject {
    func didTapView()
    func didTapSkipButton()
}

final class VideoOnboardingView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    weak var delegate: VideoOnboardingViewDelegate?
    
    // MARK: - UI properties
    
    private let imageView: UIImageView = .init()
    private let skipButton: UIButton = .init()
    
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
        
        skipButton.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapScene() {
        delegate?.didTapView()
        
    }
    
    @objc
    private func didTapSkipButton() {
        delegate?.didTapSkipButton()
        
    }
    
    private func configureLayouts() {
        addSubview(imageView)
        addSubview(skipButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            skipButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            skipButton.heightAnchor.constraint(equalToConstant: 40),
            skipButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension VideoOnboardingView {
    func set(image: UIImage?) {
        self.imageView.image = image
    }
}
