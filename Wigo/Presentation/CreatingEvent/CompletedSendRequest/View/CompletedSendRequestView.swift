//
//  CompletedSendRequestView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol CompletedSendRequestViewDelegate: AnyObject {
    func closeCompletedSendRequest()
}

final class CompletedSendRequestView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: CompletedSendRequestViewDelegate?
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    
    private let completedImageView: UIImageView = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
        closeView()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        completedImageView.image = Images.VideoRecord.completedSendRequest.image
        completedImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(completedImageView)
        
        NSLayoutConstraint.activate([
            completedImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            completedImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            completedImageView.widthAnchor.constraint(equalToConstant: 84),
            completedImageView.heightAnchor.constraint(equalToConstant: 84),
        ])
    }
    
    private func closeView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.delegate?.closeCompletedSendRequest()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension CompletedSendRequestView {}
