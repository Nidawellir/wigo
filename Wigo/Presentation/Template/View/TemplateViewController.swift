//
//  TemplateViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class TemplateViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: TemplateModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: TemplatePresenterInput
    
    // MARK: - UI properties
    
    private let templateView: TemplateView = .init()
    
    // MARK: - Initialization
    
    init(presenter: TemplatePresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = templateView
    }
}

// MARK: - TemplateModuleInput

extension TemplateViewController: TemplateModuleInput {}

// MARK: - Public methods

extension TemplateViewController {}

// MARK: - TemplatePresenterOutput

extension TemplateViewController: TemplatePresenterOutput {}
