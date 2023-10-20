//
//  MatchPreviewViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class MatchPreviewViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: MatchPreviewModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: MatchPreviewPresenterInput
    
    // MARK: - UI properties
    
    private let matchPreviewView: MatchPreviewView = .init()
    
    // MARK: - Initialization
    
    init(presenter: MatchPreviewPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        matchPreviewView.delegate = self
        
        view = matchPreviewView
    }
}

// MARK: - MatchPreviewModuleInput

extension MatchPreviewViewController: MatchPreviewModuleInput {
    func set(videoURL: URL) {
        presenter.set(videoURL: videoURL)
    }
}

// MARK: - MatchPreviewPresenterOutput

extension MatchPreviewViewController: MatchPreviewPresenterOutput {
    func didFetch(videoURL: URL) {
        matchPreviewView.set(videoURL: videoURL)
    }
}

// MARK: - MatchPreviewViewDelegate

extension MatchPreviewViewController: MatchPreviewViewDelegate {
    func didTapBackButton() {
        output?.closeMatchPreviewMatch()
    }
}
