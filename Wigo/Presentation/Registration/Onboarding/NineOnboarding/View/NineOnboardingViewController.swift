//
//  NineOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class NineOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: NineOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let nineOnboardingView: NineOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: NineOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = nineOnboardingView
    }
}

// MARK: - Public methods

extension NineOnboardingViewController {}

// MARK: - NineOnboardingPresenterOutput

extension NineOnboardingViewController: NineOnboardingPresenterOutput {}
