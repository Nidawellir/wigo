//
//  VideoOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class VideoOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: VideoOnboardingModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: VideoOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let onboardingView: VideoOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: VideoOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = onboardingView
        onboardingView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchFirstImage()
    }
}

// MARK: - VideoOnboardingModuleInput

extension VideoOnboardingViewController: VideoOnboardingModuleInput {}

// MARK: - Public methods

extension VideoOnboardingViewController {}

// MARK: - VideoOnboardingViewDelegate

extension VideoOnboardingViewController: VideoOnboardingViewDelegate {
    func didTapSkipButton() {
        output?.skipVideoOnboarding()
    }
    
    func didTapView() {
        presenter.fetchNextImage()
    }
}

// MARK: - VideoOnboardingPresenterOutput

extension VideoOnboardingViewController: VideoOnboardingPresenterOutput {
    func change(image: String) {
        onboardingView.set(image: UIImage(named: image))
    }
    
    func closeVideoOnboarding() {
        print("-closeVideoOnboarding()")
    }
}
