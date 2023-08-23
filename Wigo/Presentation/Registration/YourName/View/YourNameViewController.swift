//
//  YourNameViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class YourNameViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: YourNameModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: YourNamePresenterInput
    
    // MARK: - UI properties
    
    private let yourNameView: YourNameView = .init()
    
    // MARK: - Initialization
    
    init(presenter: YourNamePresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        yourNameView.delegate = self
        view = yourNameView
    }
}

// MARK: - YourNameModuleOutput

extension YourNameViewController: YourNameModuleInput {

}

// MARK: - Public methods

extension YourNameViewController {}

extension YourNameViewController: YourNameViewDelegate {
    func openYourBirtday() {
        output?.openYourBirtday()
    }
    
    func closeYourName() {
        output?.closeYourName()
    }
    
    func didTapContinueButton(with yourName: String) {
        presenter.fetchYourName(for: yourName)
    }
}

// MARK: - YourNamePresenterOutput

extension YourNameViewController: YourNamePresenterOutput {}
