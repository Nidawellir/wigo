//
//  VideoRecordingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class VideoRecordingViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: VideoRecordingModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: VideoRecordingPresenterInput
    
    // MARK: - UI properties
    
    private let videoRecordingView: VideoRecordingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: VideoRecordingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = videoRecordingView
        videoRecordingView.delegate = self
    }
}

// MARK: - VideoRecordingModuleInput

extension VideoRecordingViewController: VideoRecordingModuleInput {}

// MARK: - Public methods

extension VideoRecordingViewController: VideoRecordingViewDelegate {
    func closeVideoRecording() {
        output?.closeVideoRecording()
    }
}

// MARK: - Public methods

extension VideoRecordingViewController {}

// MARK: - VideoRecordingPresenterOutput

extension VideoRecordingViewController: VideoRecordingPresenterOutput {}
