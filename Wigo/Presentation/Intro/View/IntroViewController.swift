//
//  IntroViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class IntroViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: IntroModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: IntroPresenterInput
    
    // MARK: - UI properties
    
    private let introView: IntroView = .init()
    
    // MARK: - Initialization
    
    init(presenter: IntroPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = introView
    }
}

// MARK: - IntroModuleInput

extension IntroViewController: IntroModuleInput {}

// MARK: - Public methods

extension IntroViewController {}

// MARK: - IntroPresenterOutput

extension IntroViewController: IntroPresenterOutput {}
