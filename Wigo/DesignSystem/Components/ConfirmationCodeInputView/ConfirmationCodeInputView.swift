//
//  ConfirmationCodeInputView.swift
//  Acty
//
//  Created by Евгений Капанов on 16.07.2023.
//

import UIKit

protocol ConfirmationCodeInputViewDelegate: AnyObject {
    func didChangedText(on text: String)
    func didEndEditing()
}

final class ConfirmationCodeInputView: UIView {
    
    // MARK: - State
    
    enum State {
        case base
        case error
    }
    
    // MARK: - Constants
    
    private enum Constants {
        static let stackViewSpacing: CGFloat = 12.0
        static let inputTextFieldSize: CGSize = .init(width: 50.0, height: 50.0)
    }
    
    // MARK: - Public properties
    
    weak var delegate: ConfirmationCodeInputViewDelegate?
    
    // MARK: - Private properties
    
    private let length: Int
    
    // MARK: - UI properties
    
    private let stackView: UIStackView = .init()
    private lazy var inputTextFields: [ConfirmationCodeInputTextField] = (0..<length).map { _ in .init() }
    
    // MARK: - Initialization
    
    init(length: Int) {
        self.length = length
        super.init(frame: .zero)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        stackView.spacing = Constants.stackViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        inputTextFields.forEach { textField in
            textField.font = .systemFont(ofSize: 32, weight: .medium)
            textField.tintColor = .white
            textField.textColor = .white
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            textField.addTarget(self, action: #selector(didChangedTextOfInputTextField), for: .editingChanged)
            textField.delegate = self
            textField.confirmationCodeInputTextFieldDelegate = self
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapInputTextField))
            textField.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc
    private func didTapInputTextField() {
        let currentText = getCurrentText()
        let numbers = Array(currentText)
        
        inputTextFields.enumerated().forEach {
            $1.text = numbers[safe: $0].map(String.init)
        }
        
        if numbers.count == length {
            inputTextFields.last?.becomeFirstResponder()
        } else {
            inputTextFields[safe: numbers.count]?.becomeFirstResponder()
        }
    }
    
    @objc
    private func didChangedTextOfInputTextField() {
        didChangedText(on: getCurrentText())
    }
    
    private func didChangedText(on text: String) {
        let formattedCurrentText = text.count > length ? String(text.dropFirst(text.count - length)) : text
        let numbers = Array(formattedCurrentText)
        
        inputTextFields.enumerated().forEach {
            $1.text = numbers[safe: $0].map(String.init)
        }
        
        if numbers.count == length {
            inputTextFields.last?.becomeFirstResponder()
        } else {
            inputTextFields[safe: numbers.count]?.becomeFirstResponder()
        }
        
        delegate?.didChangedText(on: formattedCurrentText)
    }
    
    private func configureLayouts() {
        addSubview(stackView)
        
        inputTextFields.forEach {
            stackView.addArrangedSubview($0)
        }
        
        var constraints = [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        inputTextFields.forEach {
            constraints.append(contentsOf: [
                $0.widthAnchor.constraint(equalToConstant: Constants.inputTextFieldSize.width),
                $0.heightAnchor.constraint(equalToConstant: Constants.inputTextFieldSize.height)
            ])
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension ConfirmationCodeInputView {
    func getCurrentText() -> String {
        return inputTextFields.reduce(into: "") { $0 += $1.text ?? "" }
    }
    
    func apply(state: ConfirmationCodeInputView.State) {
        switch state {
        case .base:
            inputTextFields.forEach { $0.apply(state: state) }
        case .error:
            inputTextFields.forEach { $0.apply(state: state) }
        }
    }
}

// MARK: - UITextFieldDelegate

extension ConfirmationCodeInputView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let currentTextField: ConfirmationCodeInputTextField?
        if getCurrentText().count == length {
            currentTextField = inputTextFields.last
        } else {
            currentTextField = inputTextFields[safe: getCurrentText().count]
        }
        
        guard currentTextField === textField else { return }
            
        delegate?.didEndEditing()
    }
}

// MARK: - ConfirmationCodeInputTextFieldDelegate

extension ConfirmationCodeInputView: ConfirmationCodeInputTextFieldDelegate {
    func willDeleteBackward() {
        var currentText = getCurrentText()
        _ = currentText.popLast()
        didChangedText(on: currentText)
    }
}
