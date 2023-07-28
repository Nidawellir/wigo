//
//  PlusNumberView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/26/23.
//

import UIKit

final class PlusNumberView: UIView {
    
    // MARK: - UI properties
    
    private let numberLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .darkGray
        layer.cornerRadius = 24
        
        numberLabel.text = "+7"
        numberLabel.font = .systemFont(ofSize: 24, weight: .medium)
        numberLabel.textColor = .white
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            numberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            numberLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
