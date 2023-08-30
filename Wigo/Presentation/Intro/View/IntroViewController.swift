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
        introView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchIntroViewModels()
    }
}

// MARK: - IntroModuleInput

extension IntroViewController: IntroModuleInput {}

// MARK: - Public methods

extension IntroViewController {}

// MARK: - IntroViewDelegate

extension IntroViewController: IntroViewDelegate {
    func didTapContinueButton() {
        output?.skipIntro()
    }
}

// MARK: - IntroPresenterOutput

extension IntroViewController: IntroPresenterOutput {
    func didFetchIntro(viewModels: [IntroCollectionViewCell.ViewModel]) {
        introView.set(viewModels: viewModels)
    }
}
