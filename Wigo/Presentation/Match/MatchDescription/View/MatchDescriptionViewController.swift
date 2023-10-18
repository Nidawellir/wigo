//
//  MatchDescriptionViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class MatchDescriptionViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: MatchDescriptionModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: MatchDescriptionPresenterInput
    
    // MARK: - UI properties
    
    private let matchDescriptionView: MatchDescriptionView = .init()
    
    // MARK: - Initialization
    
    init(presenter: MatchDescriptionPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        matchDescriptionView.delegate = self
        
        view = matchDescriptionView
    }
}

// MARK: - MatchDescriptionModuleInput

extension MatchDescriptionViewController: MatchDescriptionModuleInput {}

// MARK: - MatchDescriptionPresenterOutput

extension MatchDescriptionViewController: MatchDescriptionPresenterOutput {}

// MARK: - MatchDescriptionViewDelegate

extension MatchDescriptionViewController: MatchDescriptionViewDelegate {
    func didTapBackButton() {
        output?.closeMatchDescriptionMatch()
    }
    
    func didTapThumbnailView() {
        print("-didTapThumbnailView()")
//        output?.closeMatchDescriptionMatch()
    }
}
