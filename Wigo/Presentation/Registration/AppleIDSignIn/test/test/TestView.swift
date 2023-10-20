//
//  TestView.swift
//  test
//
//  Created by Apple User on 10/12/23.
//

import AVFoundation
import UIKit

protocol VideoRecordingViewDelegate: AnyObject {
    func closeVideoRecording()
}

final class VideoRecordingView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: VideoRecordingViewDelegate?
    
    // MARK: - Capture Session
    
    private var captureSession = AVCaptureSession()
    
    // MARK: - Private properties
    
    var timer: Timer = Timer()
    var count: Int = 15
    var timerCounting: Bool = true
    var url: URL?
    var cameraConfig: CameraConfiguration!
    var videoRecordingStarted: Bool = true
    
    // MARK: - UI
    
    private let closeButton: UIButton = .init()
    private let recorderView: UIView = .init()
    private let timerView: UIView = .init()
    private let timerLabel: UILabel = .init()
    private let toggleCameraButton: UIButton = .init()
    private let shutterButton: UIButton = .init()
    private let dotImageView: UIImageView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    fileprivate func registerNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: NSNotification.Name(rawValue: "App is going background"), object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(appCameToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appMovedToBackground() {
        print("app enters background")
    }
    
    @objc func appCameToForeground() {
        print("app enters foreground")
    }
    
    func cameraConfiguration() {
        cameraConfig = CameraConfiguration()
        cameraConfig.outputType = .video
        cameraConfig.setup { (error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            try? self.cameraConfig.displayPreview(self.recorderView)
        }
    }
    
    private func configureViews() {
        backgroundColor = .black
        
//        closeButton.setImage(Images.VideoRecord.cross.image, for: .normal)
//        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        recorderView.backgroundColor = .black
        recorderView.layer.masksToBounds = true
        recorderView.layer.cornerRadius = 20
        recorderView.translatesAutoresizingMaskIntoConstraints = false
        
        timerView.backgroundColor = .clear
        timerView.layer.borderWidth = 2
        timerView.layer.borderColor = UIColor.white.cgColor
        timerView.layer.cornerRadius = 16
        timerView.translatesAutoresizingMaskIntoConstraints = false

        timerLabel.text = "00:15"
        timerLabel.font = .systemFont(ofSize: 12, weight: .regular)
        timerLabel.textColor = .white
        timerLabel.translatesAutoresizingMaskIntoConstraints = false

//        shutterButton.setImage(Images.VideoRecord.record.image, for: .normal)
        shutterButton.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        shutterButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        shutterButton.translatesAutoresizingMaskIntoConstraints = false

        dotImageView.translatesAutoresizingMaskIntoConstraints = false

//        toggleCameraButton.setImage(Images.VideoRecord.spiner.image, for: .normal)
        toggleCameraButton.addTarget(self, action: #selector(toggleCamera), for: .touchUpInside)
        toggleCameraButton.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc
    private func buttonDown(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        print("123")
        self.cameraConfig.recordVideo { (url, error) in
            guard let url = url else {
                print(error ?? "Video recording error")
                return
            }
            UISaveVideoAtPathToSavedPhotosAlbum(url.path, self, #selector(self.video(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    @objc func video(_ video: String, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        
        print("video")
    }
    
    @objc
    private func buttonUp(_ sender: Any) {
        timer.invalidate()
        
        print("223")
        
        videoRecordingStarted = false
        self.cameraConfig.stopRecording { (error) in
            print(error ?? "Video recording error")
        }
    }
    
    @objc
    private func toggleCamera(_ sender: Any) {
        do {
            try cameraConfig.switchCameras()
        } catch {
            print(error.localizedDescription)
        }
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
    
    private func configureLayouts() {
        addSubview(closeButton)
        addSubview(recorderView)
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

            recorderView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 16),
            recorderView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            recorderView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
                
            timerView.topAnchor.constraint(equalTo: recorderView.bottomAnchor, constant: 18),
            timerView.heightAnchor.constraint(equalToConstant: 32),
            timerView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            timerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            
            timerLabel.topAnchor.constraint(equalTo: timerView.topAnchor, constant: 12),
            timerLabel.leftAnchor.constraint(equalTo: timerView.leftAnchor, constant: 12),
            timerLabel.rightAnchor.constraint(equalTo: timerView.rightAnchor, constant: -12),
            timerLabel.bottomAnchor.constraint(equalTo: timerView.bottomAnchor, constant: -12),
            
            shutterButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 16),
            shutterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            shutterButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            shutterButton.heightAnchor.constraint(equalToConstant: 72),
            shutterButton.widthAnchor.constraint(equalToConstant: 72),
            
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
}
