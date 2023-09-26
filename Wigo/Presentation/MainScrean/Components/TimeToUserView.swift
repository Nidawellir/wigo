//
//  TimeToUserView.swift
//  Wigo
//
//  Created by Apple User on 9/14/23.
//

import UIKit

final class TimeToUserView: UIView {
    
    // MARK: - View properties
    
    private let locationImageView: UIImageView = .init()
    private let timeLabel: UILabel = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        layer.cornerRadius = 12
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.layer.cornerRadius = 16
        blurEffectView.clipsToBounds = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
        
        locationImageView.image = Images.MainScrean.location.image
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        timeLabel.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(locationImageView)
        addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            locationImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            locationImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            locationImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            locationImageView.widthAnchor.constraint(equalToConstant: 18),
            locationImageView.heightAnchor.constraint(equalToConstant: 18),
            
            timeLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            timeLabel.leftAnchor.constraint(equalTo: locationImageView.rightAnchor, constant: 12),
            timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTime(time: String) {
        timeLabel.text = time
    }
}
