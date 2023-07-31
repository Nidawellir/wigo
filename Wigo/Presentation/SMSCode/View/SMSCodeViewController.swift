//
//  SMSCodeViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class SMSCodeViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: SMSCodePresenterInput
    
    // MARK: - UI properties
    
    private let SMSCodeView: SMSCodeView = .init()
    
    // MARK: - Initialization
    
    init(presenter: SMSCodePresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = SMSCodeView
    }
}

// MARK: - Public methods

extension SMSCodeViewController {}

// MARK: - SMSCodePresenterOutput

extension SMSCodeViewController: SMSCodePresenterOutput {}
