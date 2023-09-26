//
//  LocationButton.swift
//  Wigo
//
//  Created by Apple User on 9/25/23.
//

import UIKit

final class LocationButton: UIButton {
    
    // MARK: - UI properties
    
    private let imagenView: UIImageView = .init()
    private let nameLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        layer.cornerRadius = 16
        backgroundColor = Colors.MainScrean.buttonBackground.color
        
        imagenView.image = Images.MainScrean.locationArrow.image
        imagenView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "Включи геолокацию"
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = Colors.CreateAccount.whiteColor.color
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(imagenView)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imagenView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imagenView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            imagenView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imagenView.heightAnchor.constraint(equalToConstant: 24),
            imagenView.widthAnchor.constraint(equalToConstant: 24),
            
            nameLabel.leftAnchor.constraint(equalTo: imagenView.rightAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: imagenView.centerYAnchor),
        ])
    }
}
