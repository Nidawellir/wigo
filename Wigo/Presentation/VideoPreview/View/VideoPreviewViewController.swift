//
//  VideoPreviewViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class VideoPreviewViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: VideoPreviewModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: VideoPreviewPresenterInput
    
    // MARK: - UI properties
    
    private let videoPreviewView: VideoPreviewView = .init()
    
    // MARK: - Initialization
    
    init(presenter: VideoPreviewPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = videoPreviewView
        videoPreviewView.delegate = self
    }
}

// MARK: - VideoPreviewModuleInput

extension VideoPreviewViewController: VideoPreviewModuleInput {
    func getVideoUrl(videoUrl: String) {
        videoPreviewView.set(videoName: videoUrl, videoFormatName: "mp4")
    }
}

// MARK: - Public methods

extension VideoPreviewViewController {}

// MARK: - VideoPreviewPresenterOutput

extension VideoPreviewViewController: VideoPreviewPresenterOutput {}

// MARK: - VideoPreviewPresenterOutput

extension VideoPreviewViewController: VideoPreviewViewDelegate {
    func openMatchingDescription(videoUrl: URL) {
        output?.openMatchingDescription(videoUrl: videoUrl)
    }
    
    func backToVideoRecording() {
        output?.backToVideoRecording()
    }
}
