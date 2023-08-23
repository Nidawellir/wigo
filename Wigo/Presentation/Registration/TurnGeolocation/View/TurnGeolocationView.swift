//
//  TurnGeolocationView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit
import MapKit

final class TurnGeolocationView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let locationManager = CLLocationManager()
    
    // MARK: - UI properties
    
    private let containerView: UIView = .init()
    private let imageView: UIImageView = .init()
    private let titleLabel: UILabel = .init()
    private let descriptionLabel: UILabel = .init()
    private let turnButton: ContinueButton = .init(title: "Включить")
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = Images.CreateAccount.geolocation.image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Включи\n геолокацию"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = Colors.CreateAccount.whiteColor.color
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "Твоя локация будет помогать тебе находить интересных людей рядом"
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = Colors.CreateAccount.whiteColor.color
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        turnButton.addTarget(self, action: #selector(didTapTurnButton), for: .touchUpInside)
        turnButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapTurnButton() {
        self.locationManager.requestAlwaysAuthorization()

        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func configureLayouts() {
        addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        addSubview(turnButton)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 52),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -52),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            turnButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 120),
            turnButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            turnButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            turnButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            turnButton.heightAnchor.constraint(equalToConstant: 58),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods

extension TurnGeolocationView {}

// MARK: - CLLocationManagerDelegate

extension TurnGeolocationView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}
