//
//  GendereViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class GendereViewController: UIViewController {
    
    // MARK: - Public properties
    
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

// MARK: - Public methods

extension GendereViewController {}

extension GendereViewController: GendereViewDelegate {
    func didTapContinueButton(with gender: String) {
        presenter.feathYourGender(for: gender)
    }
}

// MARK: - GenderePresenterOutput

extension GendereViewController: GenderePresenterOutput {}
