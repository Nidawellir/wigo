//
//  YourNameView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit
import SwiftPhoneNumberFormatter

final class YourNameView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let scrolView: UIScrollView = .init()
    private let contentView: UIView = .init()
    private let backButton: UIButton = .init()
    private let titleLabel: UILabel = .init()
    private let nameTitleLabel: UILabel = .init()
    private let nameTextField: UITextField = .init()
    private let clearTextButton: UIButton = .init()
    private let delimiterView: UIView = .init()
    private let warningLabel: UILabel = .init()
    private let continueButton: ContinueButton = .init(title: "Продолжить")
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        addGestureRecognizer(tap)
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        scrolView.showsVerticalScrollIndicator = false
        scrolView.backgroundColor = .clear
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setImage(Images.CreateAccount.backArrow.image, for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Создать аккаунт"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = Colors.CreateAccount.whiteColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameTitleLabel.text = "Твое имя"
        nameTitleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        nameTitleLabel.textColor = Colors.CreateAccount.whiteColor.color
        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Введи имя",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        nameTextField.textColor = Colors.CreateAccount.whiteColor.color
        nameTextField.font = .systemFont(ofSize: 24, weight: .medium)
        nameTextField.backgroundColor = .clear
        nameTextField.delegate = self
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        clearTextButton.setImage(Images.CreateAccount.grayCross.image, for: .normal)
        clearTextButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        clearTextButton.translatesAutoresizingMaskIntoConstraints = false
         
        delimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        delimiterView.translatesAutoresizingMaskIntoConstraints = false
        
        warningLabel.text = "Ты можешь ввести имя только один раз. Возможности изменить его уже не будет."
        warningLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        warningLabel.numberOfLines = 0
        warningLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.isEnabled = false
    }
    
    @objc
    private func dismissKeyboard() {
        endEditing(true)
    }
    
    @objc
    private func clearTextField() {
        var codeTextFieldText = nameTextField.text ?? ""
        
        guard !codeTextFieldText.isEmpty else { return }
      
        codeTextFieldText.removeAll()
        
        nameTextField.text = codeTextFieldText
    }
    
    private func configureLayouts() {
        addSubview(scrolView)
        
        scrolView.addSubview(contentView)
        
        contentView.addSubview(backButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(nameTitleLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(clearTextButton)
        contentView.addSubview(delimiterView)
        contentView.addSubview(warningLabel)
        contentView.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            scrolView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrolView.leftAnchor.constraint(equalTo: leftAnchor),
            scrolView.rightAnchor.constraint(equalTo: rightAnchor),
            scrolView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            backButton.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 36),
            backButton.widthAnchor.constraint(equalToConstant: 36),
            
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 4),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -52),
            
            nameTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            nameTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            nameTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
            
            nameTextField.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 50),
            nameTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            nameTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            
            clearTextButton.rightAnchor.constraint(equalTo: nameTextField.rightAnchor),
            clearTextButton.centerYAnchor.constraint(equalTo: nameTextField.centerYAnchor),
            clearTextButton.heightAnchor.constraint(equalToConstant: 24),
            clearTextButton.widthAnchor.constraint(equalToConstant: 24),
            
            delimiterView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            delimiterView.leftAnchor.constraint(equalTo: nameTextField.leftAnchor),
            delimiterView.rightAnchor.constraint(equalTo: nameTextField.rightAnchor),
            delimiterView.heightAnchor.constraint(equalToConstant: 1),
            
            warningLabel.topAnchor.constraint(equalTo: delimiterView.bottomAnchor, constant: 24),
            warningLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            warningLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            
            continueButton.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 100),
            continueButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            continueButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            continueButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -300),
            continueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension YourNameView {}

extension YourNameView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            delimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
            clearTextButton.setImage(Images.CreateAccount.grayCross.image, for: .normal)
        } else {
            delimiterView.backgroundColor = Colors.CreateAccount.whiteColor.color
            clearTextButton.setImage(Images.CreateAccount.whiteCross.image, for: .normal)
        }
        
        continueButton.isEnabled = nameTextField.text?.count ?? 0 > 2
    }
}
