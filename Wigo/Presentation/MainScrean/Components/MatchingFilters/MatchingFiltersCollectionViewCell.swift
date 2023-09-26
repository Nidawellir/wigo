//
//  MatchingFiltersCollectionViewCell.swift
//  Wigo
//
//  Created by Apple User on 9/15/23.
//

import UIKit

final class MatchingFiltersCollectionViewCell: UICollectionViewCell {
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let title: String
    }
    
    // MARK: - View properties
    
    private let containerView: UIView = .init()
    private let titleLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = containerView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = 6
        blurEffectView.clipsToBounds = true
        
        containerView.addSubview(blurEffectView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 4),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -4),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension MatchingFiltersCollectionViewCell {
    func set(title: String) {
        titleLabel.text = title
        
        print("123456")
    }
}
