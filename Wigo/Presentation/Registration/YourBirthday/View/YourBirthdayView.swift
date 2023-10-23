//
//  YourBirthdayView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol YourBirthdayViewDelegate: AnyObject {
    func didTapContinueButton(with birtday: String)
    func closeYourBirthday()
    func openGender()
}

final class YourBirthdayView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: YourBirthdayViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let scrolView: UIScrollView = .init()
    private let contentView: UIView = .init()
    private let backButton: UIButton = .init()
    private let titleLabel: UILabel = .init()
    private let yourBirthdayTitleLabel: UILabel = .init()
    private let dayTextField: UITextField = .init()
    private let dayDelimiterView: UIView = .init()
    private let monthTextField: UITextField = .init()
    private let monthDelimiterView: UIView = .init()
    private let yearTextField: UITextField = .init()
    private let yearDelimiterView: UIView = .init()
    private let descriptionLabel: UILabel = .init()
    private let continueButton: ContinueButton = .init(title: Localizations.CreateAccount.continueButton)
    
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
        
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        backButton.setImage(Images.CreateAccount.backArrow.image, for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = Localizations.CreateAccount.title
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = Colors.CreateAccount.whiteColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        yourBirthdayTitleLabel.text = Localizations.YourBirthday.yourBirthday
        yourBirthdayTitleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        yourBirthdayTitleLabel.textColor = Colors.CreateAccount.whiteColor.color
        yourBirthdayTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dayTextField.attributedPlaceholder = NSAttributedString(
            string: "20",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        dayTextField.textColor = Colors.CreateAccount.whiteColor.color
        dayTextField.font = .systemFont(ofSize: 24, weight: .medium)
        dayTextField.setLeftPaddingPoints(12)
        dayTextField.backgroundColor = .clear
        dayTextField.delegate = self
        dayTextField.keyboardType = .asciiCapableNumberPad
        dayTextField.translatesAutoresizingMaskIntoConstraints = false
        
        dayDelimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        dayDelimiterView.translatesAutoresizingMaskIntoConstraints = false
        
        monthTextField.attributedPlaceholder = NSAttributedString(
            string: "12",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        monthTextField.textColor = Colors.CreateAccount.whiteColor.color
        monthTextField.font = .systemFont(ofSize: 24, weight: .medium)
        monthTextField.setLeftPaddingPoints(12)
        monthTextField.backgroundColor = .clear
        monthTextField.delegate = self
        monthTextField.keyboardType = .asciiCapableNumberPad
        monthTextField.translatesAutoresizingMaskIntoConstraints = false
        
        monthDelimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        monthDelimiterView.translatesAutoresizingMaskIntoConstraints = false
        
        yearTextField.attributedPlaceholder = NSAttributedString(
            string: "1990",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        yearTextField.textColor = Colors.CreateAccount.whiteColor.color
        yearTextField.font = .systemFont(ofSize: 24, weight: .medium)
        yearTextField.setLeftPaddingPoints(12)
        yearTextField.backgroundColor = .clear
        yearTextField.delegate = self
        yearTextField.textAlignment = .center
        yearTextField.keyboardType = .asciiCapableNumberPad
        yearTextField.translatesAutoresizingMaskIntoConstraints = false
        
        yearDelimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        yearDelimiterView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = Localizations.YourBirthday.description
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        descriptionLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        continueButton.isEnabled = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.closeYourBirthday()
    }
    
    @objc
    private func didTapContinueButton() {
        delegate?.openGender()
        
        guard let day = dayTextField.text else { return }
        guard let month = monthTextField.text else { return }
        guard let year = yearTextField.text else { return }
        
        delegate?.didTapContinueButton(with: "\(day).\(month).\(year)")
    }
    
    @objc
    private func dismissKeyboard() {
        endEditing(true)
    }
    
    private func configureLayouts() {
        addSubview(scrolView)
        
        scrolView.addSubview(contentView)
        
        contentView.addSubview(backButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yourBirthdayTitleLabel)
        contentView.addSubview(dayTextField)
        contentView.addSubview(dayDelimiterView)
        contentView.addSubview(monthTextField)
        contentView.addSubview(monthDelimiterView)
        contentView.addSubview(yearTextField)
        contentView.addSubview(yearDelimiterView)
        contentView.addSubview(descriptionLabel)
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
            
            yourBirthdayTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            yourBirthdayTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            yourBirthdayTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
            
            dayTextField.topAnchor.constraint(equalTo: yourBirthdayTitleLabel.bottomAnchor, constant: 50),
            dayTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            dayDelimiterView.widthAnchor.constraint(equalToConstant: 50),
            
            dayDelimiterView.topAnchor.constraint(equalTo: dayTextField.bottomAnchor, constant: 8),
            dayDelimiterView.leftAnchor.constraint(equalTo: dayTextField.leftAnchor),
            dayDelimiterView.heightAnchor.constraint(equalToConstant: 1),
            dayDelimiterView.widthAnchor.constraint(equalToConstant: 50),
            
            monthTextField.topAnchor.constraint(equalTo: yourBirthdayTitleLabel.bottomAnchor, constant: 50),
            monthTextField.leftAnchor.constraint(equalTo: dayTextField.rightAnchor, constant: 50),
            monthTextField.widthAnchor.constraint(equalToConstant: 50),
            
            monthDelimiterView.topAnchor.constraint(equalTo: monthTextField.bottomAnchor, constant: 8),
            monthDelimiterView.leftAnchor.constraint(equalTo: monthTextField.leftAnchor),
            monthDelimiterView.heightAnchor.constraint(equalToConstant: 1),
            monthDelimiterView.widthAnchor.constraint(equalToConstant: 50),
            
            yearTextField.topAnchor.constraint(equalTo: yourBirthdayTitleLabel.bottomAnchor, constant: 50),
            yearTextField.leftAnchor.constraint(equalTo: monthTextField.rightAnchor, constant: 50),
            yearTextField.widthAnchor.constraint(equalToConstant: 112),
            
            yearDelimiterView.topAnchor.constraint(equalTo: monthTextField.bottomAnchor, constant: 8),
            yearDelimiterView.leftAnchor.constraint(equalTo: yearTextField.leftAnchor),
            yearDelimiterView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50),
            yearDelimiterView.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: dayDelimiterView.bottomAnchor, constant: 24),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            
            continueButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 100),
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

extension YourBirthdayView {}

// MARK: - UITextFieldDelegate

extension YourBirthdayView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if dayTextField.text?.isEmpty == true {
            dayDelimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        } else {
            dayDelimiterView.backgroundColor = Colors.CreateAccount.whiteColor.color
        }
        
        if monthTextField.text?.isEmpty == true {
            monthDelimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        } else {
            monthDelimiterView.backgroundColor = Colors.CreateAccount.whiteColor.color
        }
        
        if yearTextField.text?.isEmpty == true {
            yearDelimiterView.backgroundColor = Colors.CreateAccount.lightGrayTetxColor.color
        } else {
            yearDelimiterView.backgroundColor = Colors.CreateAccount.whiteColor.color
        }
        
        continueButton.isEnabled = yearTextField.text?.count ?? 0 > 3
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let maxLength: Int
    
        if textField === dayTextField {
            maxLength = 2
        } else if textField === monthTextField {
            maxLength = 2
        } else {
            maxLength = 4
        }
        
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}

