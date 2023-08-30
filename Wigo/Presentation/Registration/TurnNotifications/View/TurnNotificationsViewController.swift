//
//  TurnNotificationsViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class TurnNotificationsViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: TurnNotificationsModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: TurnNotificationsPresenterInput
    
    // MARK: - UI properties
    
    private let turnNotificationsView: TurnNotificationsView = .init()
    
    // MARK: - Initialization
    
    init(presenter: TurnNotificationsPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = turnNotificationsView
        turnNotificationsView.delegate = self
    }
}

// MARK: - TurnNotificationsModuleInput

extension TurnNotificationsViewController: TurnNotificationsModuleInput {}

// MARK: - Public methods

extension TurnNotificationsViewController {}

extension TurnNotificationsViewController: TurnNotificationsViewDelegate {
    func didTapTurnButton() {
        output?.openOnboarding()
    }
    
    func didTapNotNow() {
        
    }
}

// MARK: - TurnNotificationsPresenterOutput

extension TurnNotificationsViewController: TurnNotificationsPresenterOutput {}
