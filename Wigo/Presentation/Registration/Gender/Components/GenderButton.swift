//
//  GenderButton.swift
//  Wigo
//
//  Created by Apple User on 8/3/23.
//

import UIKit

final class GenderButton: UIButton {
    
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
        layer.cornerRadius = 23
        layer.borderWidth = 2
    
        setTitleColor(.black, for: .normal)
    
        titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func updateUI() {
        if isEnabled {
            layer.borderColor = Colors.CreateAccount.whiteColor.color.cgColor
            setTitleColor(Colors.CreateAccount.whiteColor.color, for: .normal)
        } else {
            layer.borderColor = Colors.CreateAccount.systemBlueTextColor.color.cgColor
            setTitleColor(Colors.CreateAccount.systemBlueTextColor.color, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
