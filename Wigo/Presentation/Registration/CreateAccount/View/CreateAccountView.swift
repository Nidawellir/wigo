//
//  CreateAccountView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit
import SwiftPhoneNumberFormatter

protocol CreateAccountViewDelegate: AnyObject {
    func didTapContinueButton(with phoneNumber: String)
}

final class CreateAccountView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: CreateAccountViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let scrolView: UIScrollView = .init()
    private let contentView: UIView = .init()
    private let titleLabel: UILabel = .init()
    private let myNumberLabel: UILabel = .init()
    private let plusNumberView: PlusNumberView = .init()
    private let phoneNumberTextField: PhoneFormattedTextField = .init()
    private let delimiterView: UIView = .init()
    private let codeNoticeLabel: UILabel = .init()
    private let privacyPolicyButton: UIButton = .init()
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
        
        titleLabel.text = "Создать аккаунт"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = Colors.CreateAccount.whiteColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        myNumberLabel.text = "Мой номер"
        myNumberLabel.font = .systemFont(ofSize: 28, weight: .bold)
        myNumberLabel.textColor = Colors.CreateAccount.whiteColor.color
        myNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        plusNumberView.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(
            string: "926 987 65 43",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        phoneNumberTextField.textColor = Colors.CreateAccount.whiteColor.color
        phoneNumberTextField.font = .systemFont(ofSize: 24, weight: .medium)
        phoneNumberTextField.backgroundColor = .clear
        phoneNumberTextField.textDidChangeBlock = { [weak self] _ in self?.textFieldChanged() }
        phoneNumberTextField.keyboardType = .asciiCapableNumberPad
        phoneNumberTextField.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "### ### ## ##")
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        delimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        delimiterView.translatesAutoresizingMaskIntoConstraints = false
        
        codeNoticeLabel.text = "Мы отправим сообщение с кодом подтвеврждения. За отправку сообщения может взиматься плата."
        codeNoticeLabel.numberOfLines = 0
        codeNoticeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        codeNoticeLabel.textColor = .lightGray
        codeNoticeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedString = NSMutableAttributedString()

        attributedString.append(NSAttributedString(
            string: "Нажимая кнопку «Продолжить» ты соглашаешься на ",
            attributes: [.foregroundColor: Colors.CreateAccount.lightGrayTetxColor.color]
        ))
        attributedString.append(NSAttributedString(
            string: "обработку персональных данных ",
            attributes: [.foregroundColor: Colors.CreateAccount.systemBlueTextColor.color]
        ))
        attributedString.append(NSAttributedString(
            string: "и ",
            attributes: [.foregroundColor: Colors.CreateAccount.lightGrayTetxColor.color]
        ))
        attributedString.append(NSAttributedString(
            string: "политикой конфиденциальности ",
            attributes: [.foregroundColor: Colors.CreateAccount.systemBlueTextColor.color]
        ))
        
        privacyPolicyButton.setAttributedTitle(attributedString, for: .normal)
        privacyPolicyButton.titleLabel?.font = .systemFont(ofSize: 10, weight: .semibold)
        privacyPolicyButton.titleLabel?.numberOfLines = 0
        privacyPolicyButton.titleLabel?.textAlignment = .center
//        privacyPolicyButton.addTarget(self, action: #selector(didTapReulationsLabe), for: .touchUpInside)
        privacyPolicyButton.translatesAutoresizingMaskIntoConstraints = false
        
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        continueButton.isEnabled = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func textFieldChanged() {
        if phoneNumberTextField.text?.isEmpty == true {
            delimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        } else {
            delimiterView.backgroundColor = Colors.CreateAccount.whiteColor.color
        }
        
        continueButton.isEnabled = phoneNumberTextField.phoneNumber()?.count == 10
    }
    
    @objc
    private func didTapContinueButton() {
        guard let phoneNumber = phoneNumberTextField.phoneNumber() else { return }
        
        delegate?.didTapContinueButton(with: phoneNumber)
    }
    
    @objc
    private func dismissKeyboard() {
        endEditing(true)
    }
    
    private func configureLayouts() {
        addSubview(scrolView)
        
        scrolView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(myNumberLabel)
        contentView.addSubview(plusNumberView)
        contentView.addSubview(phoneNumberTextField)
        contentView.addSubview(delimiterView)
        contentView.addSubview(codeNoticeLabel)
        contentView.addSubview(privacyPolicyButton)
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
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 52),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -52),
            
            myNumberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            myNumberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            myNumberLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
            
            plusNumberView.topAnchor.constraint(equalTo: myNumberLabel.bottomAnchor, constant: 40),
            plusNumberView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            plusNumberView.widthAnchor.constraint(equalToConstant: 70),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: plusNumberView.topAnchor),
            phoneNumberTextField.leftAnchor.constraint(equalTo: plusNumberView.rightAnchor, constant: 42),
            phoneNumberTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 60),
            phoneNumberTextField.centerYAnchor.constraint(equalTo: plusNumberView.centerYAnchor),
            
            delimiterView.leftAnchor.constraint(equalTo: plusNumberView.rightAnchor, constant: 16),
            delimiterView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            delimiterView.bottomAnchor.constraint(equalTo: plusNumberView.bottomAnchor),
            delimiterView.heightAnchor.constraint(equalToConstant: 1),
            
            codeNoticeLabel.topAnchor.constraint(equalTo: delimiterView.bottomAnchor, constant: 32),
            codeNoticeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 38),
            codeNoticeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -38),
            
            privacyPolicyButton.topAnchor.constraint(equalTo: codeNoticeLabel.bottomAnchor, constant: 62),
            privacyPolicyButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 36),
            privacyPolicyButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -36),
            
            continueButton.topAnchor.constraint(equalTo: privacyPolicyButton.bottomAnchor, constant: 36),
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

extension CreateAccountView {}
