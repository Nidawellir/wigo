//
//  MatchDescriptionView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol MatchDescriptionViewDelegate: AnyObject {
    func didTapBackButton()
    func didTapThumbnailView()
    func openCompletedSendRequest()
}

final class MatchDescriptionView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let backButtonSize: CGSize = .init(width: 36.0, height: 36.0)
        static let backButtonTopSpace: CGFloat = 16.0
        static let backButtonLeadingSpace: CGFloat = 16.0
        static let thumbnailViewCornerRadius: CGFloat = 10.0
        static let thumbnailViewTopSpace: CGFloat = 24.0
        static let thumbnailViewLeadingSpace: CGFloat = 16.0
        static let thumbnailViewSize: CGSize = .init(width: 100, height: 160)
        static let playButtonSize: CGSize = .init(width: 28.0, height: 28.0)
        static let textViewMaxCharacters: Int = 140
        static let textLeadingSpace: CGFloat = 16.0
        static let textTrailingSpace: CGFloat = 20.0
    }
    
    // MARK: - Public properties
    
    weak var delegate: MatchDescriptionViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let backButton: UIButton = .init()
    private let thumbnailView: UIView = .init()
    private let thumbnailImageView: UIImageView = .init()
    private let playButton: UIButton = .init()
    private let textView: UITextView = .init()
    private let placeholderLabel: UILabel = .init()
    private let charactersLabel: UILabel = .init()
    private let sendButton: UIButton = .init()
    private let sendRequestLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
        hideKeyboardIfTap()
        updateCharactersLabelText()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        backButton.setImage(Images.Match.backButton.image, for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        thumbnailView.layer.cornerRadius = Constants.thumbnailViewCornerRadius
        thumbnailView.clipsToBounds = true
        thumbnailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapThumbnailView)))
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.backgroundColor = .black
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        playButton.setImage(Images.Match.playButton.image, for: .normal)
        playButton.addTarget(self, action: #selector(didTapThumbnailView), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        textView.backgroundColor = Colors.CreateAccount.darkBackground.color
        textView.font = .systemFont(ofSize: 14.0, weight: .medium)
        textView.textColor = .white
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        placeholderLabel.text = "Write here your event description..."
        placeholderLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        placeholderLabel.textColor = .white
        placeholderLabel.numberOfLines = 0
        placeholderLabel.isUserInteractionEnabled = false
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        charactersLabel.font = .systemFont(ofSize: 10, weight: .bold)
        charactersLabel.textColor = .white
        charactersLabel.textAlignment = .right
        charactersLabel.alpha = 0.4
        charactersLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sendButton.backgroundColor = .clear
        sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        sendRequestLabel.text = "Send request"
        sendRequestLabel.textAlignment = .center
        sendRequestLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        sendRequestLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        sendRequestLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
    
    @objc
    private func didTapThumbnailView() {
        delegate?.didTapThumbnailView()
    }
    @objc
    private func didTapSendButton() {
        delegate?.openCompletedSendRequest()
    }
    
    private func updateCharactersLabelText() {
        charactersLabel.text = "\(textView.text.count)/\(Constants.textViewMaxCharacters)"
    }
    
    private func configureLayouts() {
        addSubview(backButton)
        addSubview(thumbnailView)
        
        thumbnailView.addSubview(thumbnailImageView)
        thumbnailView.addSubview(playButton)
        
        addSubview(textView)
        addSubview(placeholderLabel)
        addSubview(charactersLabel)
        addSubview(sendButton)
        sendButton.addSubview(sendRequestLabel)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.backButtonTopSpace),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.backButtonLeadingSpace),
            backButton.widthAnchor.constraint(equalToConstant: Constants.backButtonSize.width),
            backButton.heightAnchor.constraint(equalToConstant: Constants.backButtonSize.height),
            
            thumbnailView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Constants.thumbnailViewTopSpace),
            thumbnailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.thumbnailViewLeadingSpace),
            thumbnailView.widthAnchor.constraint(equalToConstant: Constants.thumbnailViewSize.width),
            thumbnailView.heightAnchor.constraint(equalToConstant: Constants.thumbnailViewSize.height),
            
            thumbnailImageView.topAnchor.constraint(equalTo: thumbnailView.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: thumbnailView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: thumbnailView.trailingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: thumbnailView.bottomAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: thumbnailView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: thumbnailView.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: Constants.playButtonSize.width),
            playButton.heightAnchor.constraint(equalToConstant: Constants.playButtonSize.height),
            
            textView.topAnchor.constraint(equalTo: thumbnailView.topAnchor),
            textView.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: Constants.textLeadingSpace),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.textTrailingSpace),
            
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor),
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            
            charactersLabel.topAnchor.constraint(equalTo: textView.bottomAnchor),
            charactersLabel.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: Constants.textLeadingSpace),
            charactersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.textTrailingSpace),
            charactersLabel.bottomAnchor.constraint(equalTo: thumbnailView.bottomAnchor),
            
            sendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            sendButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            
            sendRequestLabel.centerXAnchor.constraint(equalTo: sendButton.centerXAnchor),
            sendRequestLabel.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor),
        ])
    }
    
    private func hideKeyboardIfTap() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    @objc
    private func dismissKeyboard() {
        endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension MatchDescriptionView {
    func set(thumbnailImage: UIImage) {
        thumbnailImageView.image = thumbnailImage
    }
}

// MARK: - UITextViewDelegate

extension MatchDescriptionView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= Constants.textViewMaxCharacters
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateCharactersLabelText()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
}
