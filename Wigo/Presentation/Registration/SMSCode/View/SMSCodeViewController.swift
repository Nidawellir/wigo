//
//  SMSCodeViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class SMSCodeViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: SMSCodeModuleOutput?
    
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
        
        SMSCodeView.delegate = self
        
        view = SMSCodeView
    }
}

// MARK: - SMSCodeModuleInput

extension SMSCodeViewController: SMSCodeModuleInput {}

// MARK: - Public methods

extension SMSCodeViewController {}

// MARK: - SMSCodeViewDelegate

extension SMSCodeViewController: SMSCodeViewDelegate {
    func closeSMSCode() {
        output?.closeSMSCode()
    }
    
    func textFieldDidEdeting(with SMSCode: String) {
//        presenter.fetchSMSCode(for: SMSCode)
        output?.openYourName()
    }
}

// MARK: - SMSCodePresenterOutput

extension SMSCodeViewController: SMSCodePresenterOutput {}
