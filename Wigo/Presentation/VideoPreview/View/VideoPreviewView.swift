//
//  VideoPreviewView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit
import AVFoundation

protocol VideoPreviewViewDelegate: AnyObject {
    func backToVideoRecording()
    func openMatchingDescription(videoUrl: URL)
}

final class VideoPreviewView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: VideoPreviewViewDelegate?
    
    // MARK: - Private properties
    
    private var videoPlayer: AVPlayer?
    private var videoURL: URL?
    
    // MARK: - UI properties
    
    private let containerView: UIView = .init()
    private let playerView = AVPlayerLayer()
    private let buttonStackView: UIStackView = .init()
    private let videoDubbingButton: UIButton = .init()
    private let completedVideoButton: UIButton = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
        configureBindings()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
        containerView.layer.addSublayer(playerView)
        containerView.backgroundColor = .blue
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 54
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        videoDubbingButton.setImage(Images.VideoRecord.retry.image, for: .normal)
        videoDubbingButton.addTarget(self, action: #selector(didTapVideoDubbingButton), for: .touchUpInside)
        videoDubbingButton.translatesAutoresizingMaskIntoConstraints = false
        
        completedVideoButton.setImage(Images.VideoRecord.check.image, for: .normal)
        completedVideoButton.addTarget(self, action: #selector(didTapCompletedVideoButton), for: .touchUpInside)
        completedVideoButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapVideoDubbingButton() {
        videoPlayer?.pause()
        delegate?.backToVideoRecording()
    }
    
    @objc
    private func didTapCompletedVideoButton() {
        videoPlayer?.pause()
        guard let url = videoURL else { return }
        delegate?.openMatchingDescription(videoUrl: url)
    }
    
    private func configureBindings() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(restartVideo),
            name: .AVPlayerItemDidPlayToEndTime,
            object: self.videoPlayer
        )
    }
    
    @objc
    private func restartVideo() {
        videoPlayer?.pause()
        videoPlayer?.currentItem?.seek(to: CMTime.zero, completionHandler: { [weak self] _ in
            self?.videoPlayer?.play()
        })
    }
    
    private func configureLayouts() {
        addSubview(containerView)
        addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(videoDubbingButton)
        buttonStackView.addArrangedSubview(completedVideoButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 50),
            buttonStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            
            videoDubbingButton.widthAnchor.constraint(equalToConstant: 50),
            videoDubbingButton.heightAnchor.constraint(equalToConstant: 50),
            
            completedVideoButton.widthAnchor.constraint(equalToConstant: 50),
            completedVideoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerView.frame = containerView.bounds
    }
}

// MARK: - Public methods

extension VideoPreviewView {
    func set(videoName: String, videoFormatName: String) {
        let videoURL = URL(fileURLWithPath: videoName)
        videoPlayer = AVPlayer(url: videoURL)
        
        self.videoURL = videoURL
                
        playerView.player = videoPlayer
        playerView.videoGravity = .resizeAspectFill
        videoPlayer?.volume = 100
        videoPlayer?.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { self.videoPlayer?.play() }
    }
}
