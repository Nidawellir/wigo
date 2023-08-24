//
//  YourBirthdayViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class YourBirthdayViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: YourBirthdayModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: YourBirthdayPresenterInput
    
    // MARK: - UI properties
    
    private let yourBirthdayView: YourBirthdayView = .init()
    
    // MARK: - Initialization
    
    init(presenter: YourBirthdayPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        yourBirthdayView.delegate = self
        
        view = yourBirthdayView
    }
}

// MARK: - YourBirthdayModuleInput

extension YourBirthdayViewController: YourBirthdayModuleInput {}

// MARK: - Public methods

extension YourBirthdayViewController {}

// MARK: - YourBirthdayViewDelegate

extension YourBirthdayViewController: YourBirthdayViewDelegate {
    func openGender() {
        output?.openGender()
    }
    
    func closeYourBirthday() {
        output?.closeYourBirthday()
    }
    
    func didTapContinueButton(with birtday: String) {
        presenter.fetchBirthday(for: birtday)
    }
}

// MARK: - YourBirthdayPresenterOutput

extension YourBirthdayViewController: YourBirthdayPresenterOutput {}
