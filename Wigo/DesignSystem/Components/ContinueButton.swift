//
//  ContinueButton.swift
//  Wigo-Native
//
//  Created by Apple User on 7/26/23.
//

import UIKit

final class ContinueButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Initializer
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        
        configureButton()
        updateUI()
    }
    
    private func configureButton() {
        layer.cornerRadius = 16
    
        setTitleColor(.black, for: .normal)
    
        titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private func updateUI() {
        if isEnabled {
            backgroundColor = .systemBlue
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = .darkGray
            setTitleColor(.lightGray, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

