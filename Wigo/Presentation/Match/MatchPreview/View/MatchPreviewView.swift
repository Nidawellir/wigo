//
//  MatchPreviewView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import AVFoundation
import UIKit

protocol MatchPreviewViewDelegate: AnyObject {
    func didTapBackButton()
}

final class MatchPreviewView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let backButtonSize: CGSize = .init(width: 36.0, height: 36.0)
        static let backButtonTopSpace: CGFloat = 16.0
        static let backButtonLeadingSpace: CGFloat = 16.0
        static let thumbnailViewCornerRadius: CGFloat = 14.0
        static let videoViewTopSpace: CGFloat = 42.0
        static let videoViewAspectRatio: CGFloat = 560 / 375
    }
    
    // MARK: - Public properties
    
    weak var delegate: MatchPreviewViewDelegate?
    
    // MARK: - Private properties
    
    private let player: AVPlayer = .init()
    
    // MARK: - UI properties
    
    private let backButton: UIButton = .init()
    private let videoView: UIView = .init()
    private lazy var playerLayer: AVPlayerLayer = .init(player: player)
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
        configureBindings()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        backButton.setImage(Images.Match.backButton.image, for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        videoView.backgroundColor = .black
        videoView.layer.cornerRadius = Constants.thumbnailViewCornerRadius
        videoView.clipsToBounds = true
        videoView.translatesAutoresizingMaskIntoConstraints = false
        
        playerLayer.videoGravity = .resizeAspectFill
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
    
    private func configureLayouts() {
        addSubview(backButton)
        addSubview(videoView)
    
        videoView.layer.addSublayer(playerLayer)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.backButtonTopSpace),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.backButtonLeadingSpace),
            backButton.widthAnchor.constraint(equalToConstant: Constants.backButtonSize.width),
            backButton.heightAnchor.constraint(equalToConstant: Constants.backButtonSize.height),
            
            videoView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Constants.videoViewTopSpace),
            videoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            videoView.heightAnchor.constraint(equalTo: videoView.widthAnchor, multiplier: Constants.videoViewAspectRatio)
        ])
    }
    
    private func configureBindings() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(restartVideo),
            name: .AVPlayerItemDidPlayToEndTime,
            object: self.player.currentItem
        )
    }
    
    @objc
    private func restartVideo() {
        player.pause()
        player.currentItem?.seek(to: CMTime.zero, completionHandler: { [weak self] _ in
            self?.player.play()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer.frame = videoView.bounds
    }
}

// MARK: - Public methods

extension MatchPreviewView {
    func set(videoURL: URL) {
        let playerItem = AVPlayerItem(url: videoURL)
        
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
}
