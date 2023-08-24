//
//  TurnGeolocationViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class TurnGeolocationViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: TurnGeolocationModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: TurnGeolocationPresenterInput
    
    // MARK: - UI properties
    
    private let turnGeolocationView: TurnGeolocationView = .init()
    
    // MARK: - Initialization
    
    init(presenter: TurnGeolocationPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = turnGeolocationView
        turnGeolocationView.delegate = self
    }
}

// MARK: - TurnGeolocationModuleInpute

extension TurnGeolocationViewController: TurnGeolocationModuleInpute {}

// MARK: - Public methods

extension TurnGeolocationViewController {}

// MARK: - TurnGeolocationViewDelegate

extension TurnGeolocationViewController: TurnGeolocationViewDelegate {
    func didTapTurnButton() {
        output?.openTurnNotification()
    }
}

// MARK: - TurnGeolocationPresenterOutput

extension TurnGeolocationViewController: TurnGeolocationPresenterOutput {}
