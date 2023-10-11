//
//  AppleIDSignInView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import AuthenticationServices
import UIKit

protocol AppleIDSignInViewDelegate: AnyObject {
    func openCreateAccount()
}

final class AppleIDSignInView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: AppleIDSignInViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let logoImageView: UIImageView = .init()
    private let signInButton: ASAuthorizationAppleIDButton = .init()
    private let appleImageView: UIImageView = .init()
    private let signInLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        logoImageView.image = Images.CreateAccount.logo.image
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
//        signInButton.layer.cornerRadius = 4
//        signInButton.backgroundColor = Colors.CreateAccount.whiteColor.color
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
//        appleImageView.image = Images.CreateAccount.apple.image
//        appleImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        signInLabel.text = "Sign in with Apple"
//        signInLabel.font = .systemFont(ofSize: 16, weight: .medium)
//        signInLabel.textColor = Colors.CreateAccount.darkBackground.color
//        signInLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapSignInButton() {
        delegate?.openCreateAccount()
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    private func configureLayouts() {
        addSubview(logoImageView)
        addSubview(signInButton)
        signInButton.addSubview(appleImageView)
        signInButton.addSubview(signInLabel)
        
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            
            signInButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            signInButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -94),
            signInButton.heightAnchor.constraint(equalToConstant: 53),
            
            appleImageView.rightAnchor.constraint(equalTo: signInLabel.leftAnchor, constant: -4),
            appleImageView.centerYAnchor.constraint(equalTo: signInButton.centerYAnchor),
            appleImageView.heightAnchor.constraint(equalToConstant: 24),
            appleImageView.widthAnchor.constraint(equalToConstant: 24),
            
            signInLabel.centerYAnchor.constraint(equalTo: signInButton.centerYAnchor),
            signInLabel.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension AppleIDSignInView {}

// MARK: - ASAuthorizationControllerDelegate

extension AppleIDSignInView: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("failed")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard
            let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
            let tokenData = credential.authorizationCode,
            let token = String(data: tokenData, encoding: .utf8)
        else { return }
        
        delegate?.openCreateAccount()
    }
}

// MARK: - ASWebAuthenticationPresentationContextProviding

extension AppleIDSignInView: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return window!
    }
}
