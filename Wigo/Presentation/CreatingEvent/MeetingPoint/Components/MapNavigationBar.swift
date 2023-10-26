//
//  MapNavigationBar.swift
//  Wigo
//
//  Created by Apple User on 10/24/23.
//

import Foundation
import UIKit

final class CustomNavigationBar: UIView {
    
    // MARK: - Public properties
    
    private let navigationController: UINavigationController = .init()
    
    // MARK: - View properties
    
    private let stackView: UIStackView = .init()
    public let backButton: UIButton = .init()
    private let titleLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        backgroundColor = .black
        
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setImage(Images.Map.back.image, for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Локация"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(stackView)
        addSubview(backButton)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            backButton.heightAnchor.constraint(equalToConstant: 36),
            
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

