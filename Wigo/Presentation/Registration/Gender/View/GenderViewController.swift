//
//  GendereViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class GendereViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: GenderModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: GenderePresenterInput
    
    // MARK: - UI properties
    
    private let gendereView: GendereView = .init()
    
    // MARK: - Initialization
    
    init(presenter: GenderePresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        gendereView.delegate = self
        
        view = gendereView
    }
}

// MARK: - GenderModuleInput

extension GendereViewController: GenderModuleInput {}

// MARK: - Public methods

extension GendereViewController {}

// MARK: - GendereViewDelegate

extension GendereViewController: GendereViewDelegate {
    func openTurnGeolocation() {
        output?.openTurnGeolocation()
    }
    
    func closeGender() {
        output?.closeGender()
    }
    
    func didTapContinueButton(with gender: String) {
        presenter.feathYourGender(for: gender)
    }
}

// MARK: - GenderePresenterOutput

extension GendereViewController: GenderePresenterOutput {}
