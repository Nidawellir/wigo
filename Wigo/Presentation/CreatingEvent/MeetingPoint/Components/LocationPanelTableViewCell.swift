//
//  LocationPanelTableViewCell.swift
//  Wigo
//
//  Created by Apple User on 10/24/23.
//

import UIKit

final class LocationPanelTableViewCell: UITableViewCell {
    
    struct LocationModel {
        let name: String
        let description: String
        let latitude: Double?
        let longitude: Double?
    }
    
    // MARK: - LocationPanelTableViewCellIdentifire
    
    static let locationPanelTableViewCellIdentifire = "LocationPanelTableViewCellIdentifire"
    
    // MARK: - View properties
    
    private let containerView: UIView = .init()
    private let imagenView: UIImageView = .init()
    private let titleLabel: UILabel = .init()
    private let descriptionLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        backgroundColor = Colors.Map.locationBackground.color
        
        containerView.backgroundColor = Colors.Map.locationBackground.color
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        imagenView.image = Images.Map.location.image
        imagenView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .medium)
        descriptionLabel.textColor = .gray
        descriptionLabel.textAlignment = .left
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(imagenView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            imagenView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            imagenView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imagenView.heightAnchor.constraint(equalToConstant: 32),
            imagenView.widthAnchor.constraint(equalToConstant: 32),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: imagenView.rightAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.leftAnchor.constraint(equalTo: imagenView.rightAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    func set(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
