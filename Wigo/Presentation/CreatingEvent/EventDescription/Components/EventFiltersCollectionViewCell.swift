//
//  EventFiltersCollectionViewCell.swift
//  Wigo
//
//  Created by Apple User on 10/23/23.
//

import UIKit

final class EventFiltersCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            updateUI()
        }
    }
    
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
        
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = Colors.MainScrean.cellBackground.color
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
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
            
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    func updateUI() {
        if isSelected {
            containerView.backgroundColor = Colors.CreateAccount.systemBlueTextColor.color
            titleLabel.textColor = Colors.CreateAccount.whiteColor.color
        } else {
            containerView.backgroundColor = Colors.MainScrean.cellBackground.color
            titleLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension EventFiltersCollectionViewCell {
    func set(viewModel: ViewModel) {
        titleLabel.text = viewModel.title
    }
}
