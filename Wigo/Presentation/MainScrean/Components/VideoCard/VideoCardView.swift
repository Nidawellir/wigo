//
//  VideoCardView.swift
//  Wigo
//
//  Created by Apple User on 9/22/23.
//

import UIKit
import AVFoundation

final class VideoCardView: UIView {
    
    // MARK: - Private properties
    
    private var timer: Timer?
    private var secondsRemaining: Int = 15
    private var videoPlayer: AVPlayer?
    private var shadowView: UIView = .init()
    
    // MARK: - Publick properties
    
    
    // MARK: - ViewModel
    
    struct ViewModel {
        let name: String
        let description: String
        let location: String
        let timeToUser: String
        let videoFileName: String
        let videoFormatName: String
        let matchingFilters: [String]
    }
    
    // MARK: - View properties
    
    private let containerView: UIView = .init()
    private let playerView = AVPlayerLayer()
    private let durationView: UIView = .init()
    private let durationLabel: UILabel = .init()
    private let muteButton: UIButton = .init()
    private let nameLabel: UILabel = .init()
    private let timeToUserView: TimeToUserView = .init()
    private let descriptionLabel: UILabel = .init()
    private let moreButton: UIButton = .init()
    private let locationImage: UIImageView = .init()
    private let locationLabel: UILabel = .init()
    private let matchingFiltersView: MatchingFiltersView = .init()
    private let optionButton: UIButton = .init()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        startTimer()
        configureViews()
        configureBindings()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .clear
        
        containerView.layer.addSublayer(playerView)
        
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
    
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = durationView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = 16
        blurEffectView.clipsToBounds = true
        
        durationView.addSubview(blurEffectView)
        durationView.translatesAutoresizingMaskIntoConstraints = false
        
        durationLabel.text = "00:15"
        durationLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        durationLabel.textColor = Colors.CreateAccount.whiteColor.color
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = Colors.CreateAccount.whiteColor.color
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeToUserView.translatesAutoresizingMaskIntoConstraints = false
        
        muteButton.setImage(Images.MainScrean.mute.image, for: .normal)
        muteButton.addTarget(self, action: #selector(didTapMuteButton), for: .touchUpInside)
        muteButton.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .medium)
        descriptionLabel.numberOfLines = 1
        descriptionLabel.textColor = Colors.CreateAccount.whiteColor.color
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        moreButton.backgroundColor = .clear
        moreButton.setTitle("Еще", for: .normal)
        moreButton.titleLabel?.textColor = Colors.CreateAccount.lightGrayTetxColor.color
        moreButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        moreButton.addTarget(self, action: #selector(didTapMoreButton), for: .touchUpInside)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        locationImage.image = Images.MainScrean.location.image
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        
        locationLabel.font = .systemFont(ofSize: 10, weight: .bold)
        locationLabel.textColor = Colors.CreateAccount.whiteColor.color
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        matchingFiltersView.translatesAutoresizingMaskIntoConstraints = false
        
        optionButton.setImage(Images.MainScrean.setting.image, for: .normal)
        optionButton.addTarget(self, action: #selector(didTapOptionButton), for: .touchUpInside)
        optionButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureBindings() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(restartVideo),
            name: .AVPlayerItemDidPlayToEndTime,
            object: self.videoPlayer?.currentItem
        )
    }
    
    @objc
    private func restartVideo() {
        videoPlayer?.pause()
        videoPlayer?.currentItem?.seek(to: CMTime.zero, completionHandler: { [weak self] _ in
            self?.videoPlayer?.play()
        })
    }
    
    @objc
    private func didTapMuteButton() {
        videoPlayer?.isMuted.toggle()
        if videoPlayer?.isMuted == true {
            muteButton.setImage(Images.MainScrean.mute.image, for: .normal)
        } else {
            muteButton.setImage(Images.MainScrean.checkMarkFilterOn.image, for: .normal)
        }
        
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc
    private func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
        } else {
            timer?.invalidate()
            secondsRemaining = 15
        }
        
        let newString = String(format: "%02d", secondsRemaining)
            
        durationLabel.text = "00:\(newString)"
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
    
    @objc
    private func didTapMoreButton() {
        if descriptionLabel.numberOfLines == 1 {
            descriptionLabel.numberOfLines = 0
            moreButton.setTitle("Mеньше", for: .normal)
        } else {
            descriptionLabel.numberOfLines = 1
            moreButton.setTitle("Далее", for: .normal)
        }
    }
    
    @objc
    private func didTapOptionButton() {
        print("didTapOptionButton")
    }
    
    private func configureLayouts() {
        addSubview(containerView)
        
        containerView.addSubview(shadowView)
        containerView.addSubview(durationView)
        durationView.addSubview(durationLabel)
        
        containerView.addSubview(muteButton)
        containerView.addSubview(nameLabel)
        containerView.addSubview(timeToUserView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(moreButton)
        containerView.addSubview(locationImage)
        containerView.addSubview(locationLabel)
        containerView.addSubview(matchingFiltersView)
        containerView.addSubview(optionButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leftAnchor.constraint(equalTo: leftAnchor),
            containerView.rightAnchor.constraint(equalTo: rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            durationView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            durationView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            durationView.heightAnchor.constraint(equalToConstant: 30),
            durationView.widthAnchor.constraint(equalToConstant: 65),
            
            durationLabel.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),
            durationLabel.centerXAnchor.constraint(equalTo: durationView.centerXAnchor),
            
            muteButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            muteButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16),
            muteButton.heightAnchor.constraint(equalToConstant: 32),
            muteButton.widthAnchor.constraint(equalToConstant: 32),
            
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -18),
            
            timeToUserView.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 16),
            timeToUserView.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            timeToUserView.heightAnchor.constraint(equalToConstant: 32),
            
            descriptionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: locationImage.topAnchor, constant: -16),
            descriptionLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -70),
            
            moreButton.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
            moreButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            moreButton.heightAnchor.constraint(equalToConstant: 14),
            
            locationImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            locationImage.bottomAnchor.constraint(equalTo: matchingFiltersView.topAnchor, constant: -16),
            locationImage.heightAnchor.constraint(equalToConstant: 14),
            locationImage.widthAnchor.constraint(equalToConstant: 14),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor),
            locationLabel.leftAnchor.constraint(equalTo: locationImage.rightAnchor, constant: 6),
            
            matchingFiltersView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            matchingFiltersView.rightAnchor.constraint(equalTo: optionButton.leftAnchor, constant: -16),
            matchingFiltersView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            matchingFiltersView.heightAnchor.constraint(equalToConstant: 32),
            
            optionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            optionButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16),
            optionButton.heightAnchor.constraint(equalToConstant: 32),
            optionButton.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerView.frame = containerView.frame
    }
}

// MARK: - Public properties

extension VideoCardView {
    func set(videoCardModel: ViewModel) {
        nameLabel.text = videoCardModel.name
        timeToUserView.setTime(time: videoCardModel.timeToUser)
        descriptionLabel.text = videoCardModel.description
        locationLabel.text = videoCardModel.location
        matchingFiltersView.set(viewModels: videoCardModel.matchingFilters)
        
        guard let path = Bundle.main.path(forResource: videoCardModel.videoFileName, ofType: videoCardModel.videoFormatName) else { return }
        videoPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        
        playerView.player = videoPlayer
        playerView.videoGravity = .resizeAspectFill
        videoPlayer?.isMuted = true
        videoPlayer?.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { self.videoPlayer?.play() }
    }
    
    func leftSwipe() {
        shadowView.backgroundColor = Colors.MainScrean.leftSwipe.color
        shadowView.layer.borderWidth = 3
        shadowView.layer.borderColor = Colors.MainScrean.leftSwipe.color.cgColor
        shadowView.alpha = 0.7
        shadowView.frame = containerView.frame
        shadowView.clipsToBounds = false
    }
    
    func rightSwipe() {
        shadowView.backgroundColor = Colors.MainScrean.rightSwipe.color
        shadowView.layer.borderWidth = 3
        shadowView.layer.borderColor = Colors.MainScrean.rightSwipe.color.cgColor
        shadowView.alpha = 0.7
        shadowView.frame = containerView.frame
        shadowView.clipsToBounds = false
    }
}
