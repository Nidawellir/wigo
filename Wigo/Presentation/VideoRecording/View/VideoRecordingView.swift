//
//  VideoRecordingView.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol VideoRecordingViewDelegate: AnyObject {
    func closeVideoRecording()
}

final class VideoRecordingView: UIView {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    weak var delegate: VideoRecordingViewDelegate?
    var timer: Timer = Timer()
    var count: Int = 15
    var timerCounting: Bool = false
    var url: URL?
    
    // MARK: - UI properties
    
//    private var recorderView: RecorderView = {
//        var recorder = RecorderView()
//        recorder.translatesAutoresizingMaskIntoConstraints = false
//        return recorder
//    }()
    private let closeButton: UIButton = .init()
    private let timerView: UIView = .init()
    private let timerLabel: UILabel = .init()
    private let toggleCameraButton: UIButton = .init()
    private let shutterButton: UIButton = .init()
    private let dotImageView: UIImageView = .init()

    var videoRecordingStarted: Bool = false {
        didSet{
            if videoRecordingStarted {
                self.shutterButton.setImage(Images.VideoRecord.record.image, for: .normal)
            } else {
                self.shutterButton.setImage(Images.VideoRecord.record.image, for: .normal)
            }
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = Colors.CreateAccount.darkBackground.color
        
//        recorderView.layer.masksToBounds = true
//        recorderView.layer.cornerRadius = 16
//        recorderView.recorder.isFacingFront = true

        closeButton.setImage(Images.VideoRecord.cross.image, for: .normal)
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        timerView.backgroundColor = .clear
        timerView.layer.borderWidth = 2
        timerView.layer.borderColor = UIColor.white.cgColor
        timerView.layer.cornerRadius = 16
        timerView.translatesAutoresizingMaskIntoConstraints = false

        timerLabel.text = "00:15"
        timerLabel.font = .systemFont(ofSize: 12, weight: .regular)
        timerLabel.textColor = .white
        timerLabel.translatesAutoresizingMaskIntoConstraints = false

        shutterButton.setImage(Images.VideoRecord.record.image, for: .normal)
        shutterButton.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        shutterButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        shutterButton.translatesAutoresizingMaskIntoConstraints = false

        dotImageView.image = UIImage(named: "dot")
        dotImageView.translatesAutoresizingMaskIntoConstraints = false

        toggleCameraButton.setImage(Images.VideoRecord.spiner.image, for: .normal)
        toggleCameraButton.addTarget(self, action: #selector(toggleCamera), for: .touchUpInside)
        toggleCameraButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func didTapCloseButton() {
        delegate?.closeVideoRecording()
    }

    @objc
    private func buttonDown(_ sender: Any) {
//        recorderView.recorder.startRecording()

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)

        videoRecordingStarted = true

    }

    @objc
    private func buttonUp(_ sender: Any) {
//        recorderView.recorder.stopRecording()

        timer.invalidate()

        videoRecordingStarted = false

//        dismiss(animated: true)
    }

    @objc
    private func step() {
        if count > 0 {
            count -= 1
        } else {
            timer.invalidate()
            count = 15
        }

        let newString = String(format: "%02d", count)

        timerLabel.text = "00:\(newString)"

    }

    @objc
    private func toggleCamera(_ sender: Any) {
//        recorderView.recorder.isFacingFront = !recorderView.recorder.isFacingFront
    }
    
    private func configureLayouts() {
        addSubview(closeButton)
//        addSubview(recorderView)
        addSubview(timerView)
        addSubview(timerLabel)
        addSubview(shutterButton)
        addSubview(dotImageView)
        addSubview(toggleCameraButton)
            
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),

//            recorderView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 16),
//            recorderView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            recorderView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

//            timerView.topAnchor.constraint(equalTo: recorderView.bottomAnchor, constant: 18),
            timerView.heightAnchor.constraint(equalToConstant: 32),
            timerView.centerXAnchor.constraint(equalTo: centerXAnchor),

            timerLabel.topAnchor.constraint(equalTo: timerView.topAnchor, constant: 12),
            timerLabel.leftAnchor.constraint(equalTo: timerView.leftAnchor, constant: 12),
            timerLabel.rightAnchor.constraint(equalTo: timerView.rightAnchor, constant: -12),
            timerLabel.bottomAnchor.constraint(equalTo: timerView.bottomAnchor, constant: -12),

            shutterButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 16),
            shutterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            shutterButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            shutterButton.heightAnchor.constraint(equalToConstant: 72),
            shutterButton.widthAnchor.constraint(equalToConstant: 72),

            dotImageView.centerXAnchor.constraint(equalTo: shutterButton.centerXAnchor),
            dotImageView.centerYAnchor.constraint(equalTo: shutterButton.centerYAnchor),
            dotImageView.heightAnchor.constraint(equalToConstant: 20),
            dotImageView.widthAnchor.constraint(equalToConstant: 20),

            toggleCameraButton.leftAnchor.constraint(equalTo: shutterButton.rightAnchor, constant: 50),
            toggleCameraButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            toggleCameraButton.centerYAnchor.constraint(equalTo: shutterButton.centerYAnchor),
            toggleCameraButton.heightAnchor.constraint(equalToConstant: 48),
            toggleCameraButton.widthAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
}

// MARK: - Public methods

extension VideoRecordingView {}
