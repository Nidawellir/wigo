//
//  ConfirmationCodeInputTextField.swift
//  Acty
//
//  Created by Евгений Капанов on 16.07.2023.
//

import UIKit

protocol ConfirmationCodeInputTextFieldDelegate: AnyObject {
    func willDeleteBackward()
}

final class ConfirmationCodeInputTextField: UITextField {
    
    // MARK: - Constants
    
    private enum Constants {
        static let roundedContainerViewCornerRadius: CGFloat = 4.0
    }
    
    // MARK: - Public properties
    
    weak var confirmationCodeInputTextFieldDelegate: ConfirmationCodeInputTextFieldDelegate?
    
    // MARK: - Private properties
    
    private let tapAreaInsets: UIEdgeInsets
    
    // MARK: - UI properties
    
    private let roundedContainerView: UIView = .init()
    private let delimiterView: UIView = .init()
    
    // MARK: - Initialization
    
    init(tapAreaInsets: UIEdgeInsets = .zero) {
        self.tapAreaInsets = tapAreaInsets
        super.init(frame: .zero)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        roundedContainerView.backgroundColor = .clear
        roundedContainerView.layer.cornerRadius = Constants.roundedContainerViewCornerRadius
        roundedContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        delimiterView.backgroundColor = .white
        delimiterView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(roundedContainerView)
        addSubview(delimiterView)
        
        NSLayoutConstraint.activate([
            roundedContainerView.topAnchor.constraint(equalTo: topAnchor),
            roundedContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            delimiterView.topAnchor.constraint(equalTo: roundedContainerView.bottomAnchor, constant: 12),
            delimiterView.leftAnchor.constraint(equalTo: roundedContainerView.leftAnchor),
            delimiterView.rightAnchor.constraint(equalTo: roundedContainerView.rightAnchor),
            delimiterView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let tapAreaBounds = bounds.inset(by: tapAreaInsets.invert())
        
        return tapAreaBounds.contains(point)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    override func deleteBackward() {
        confirmationCodeInputTextFieldDelegate?.willDeleteBackward()
        super.deleteBackward()
    }
}

// MARK: - Public methods

extension ConfirmationCodeInputTextField {
    func apply(state: ConfirmationCodeInputView.State) {
        switch state {
        case .base:
            roundedContainerView.layer.borderColor = UIColor.clear.cgColor
            roundedContainerView.layer.borderWidth = 0.0
        case .error:
            roundedContainerView.layer.borderColor = UIColor.red.cgColor
            roundedContainerView.layer.borderWidth = 1.0
        }
    }
}
