//
//  OnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: OnboardingModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: OnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let onboardingView: OnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: OnboardingPresenterInput) {
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

// MARK: - OnboardingModuleInput

extension OnboardingViewController: OnboardingModuleInput {}

// MARK: - Public methods

extension OnboardingViewController {}

// MARK: - OnboardingViewDelegate

extension OnboardingViewController: OnboardingViewDelegate {
    func didTapSkipButton() {
        output?.skipOnboarding()
    }
    
    func didTapView() {
        presenter.fetchNextImage()
    }
}

// MARK: - OnboardingPresenterOutput

extension OnboardingViewController: OnboardingPresenterOutput {
    func change(image: String) {
        onboardingView.set(image: UIImage(named: image))
    }
    
    func closeOnboarding() {
        print("-closeOnboarding()")
    }
}
