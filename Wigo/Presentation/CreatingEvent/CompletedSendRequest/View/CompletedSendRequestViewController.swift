//
//  CompletedSendRequestViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class CompletedSendRequestViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: CompletedSendRequestModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: CompletedSendRequestPresenterInput
    
    // MARK: - UI properties
    
    private let completedSendRequestView: CompletedSendRequestView = .init()
    
    // MARK: - Initialization
    
    init(presenter: CompletedSendRequestPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = completedSendRequestView
        completedSendRequestView.delegate = self
    }
}

// MARK: - CompletedSendRequestModuleInput

extension CompletedSendRequestViewController: CompletedSendRequestModuleInput {}

// MARK: - Public methods

extension CompletedSendRequestViewController {}

// MARK: - CompletedSendRequestPresenterOutput

extension CompletedSendRequestViewController: CompletedSendRequestPresenterOutput {}

// MARK: - Public methods

extension CompletedSendRequestViewController: CompletedSendRequestViewDelegate {
    func closeCompletedSendRequest() {
        output?.closeCompletedSendRequest()
    }
}
