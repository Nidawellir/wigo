//
//  CurrentFilter.swift
//  Wigo
//
//  Created by Apple User on 9/26/23.
//

import UIKit

final class CurrentFilter: UIButton {
    
    // MARK: - Public properties
    
    var isOn: Bool = false {
        didSet {
            didChangedStyle()
        }
    }
    
    // MARK: - Private properties
    
    private let imagenView: UIImageView = .init()
    private let nameLabel: UILabel = .init()
        
    // MARK: - Initialization
    
    init(text: String) {
        
        super.init(frame: .zero)
        
        nameLabel.text = text
        
        configureViews()
        configureLayout()
        didChangedStyle()
    }
    
    private func configureViews() {
        backgroundColor = .clear
        
        imagenView.image = Images.MainScrean.checkMarkFilterOff.image
        imagenView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        addSubview(imagenView)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imagenView.topAnchor.constraint(equalTo: topAnchor),
            imagenView.leftAnchor.constraint(equalTo: leftAnchor),
            imagenView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imagenView.heightAnchor.constraint(equalToConstant: 20),
            imagenView.widthAnchor.constraint(equalToConstant: 20),
            
            nameLabel.leftAnchor.constraint(equalTo: imagenView.rightAnchor, constant: 12),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: imagenView.centerYAnchor)
        ])
    }
    
    private func didChangedStyle() {
        if isOn {
            imagenView.image = Images.MainScrean.checkMarkFilterOn.image
            nameLabel.textColor = Colors.CreateAccount.whiteColor.color
        } else {
            imagenView.image = Images.MainScrean.checkMarkFilterOff.image
            nameLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
