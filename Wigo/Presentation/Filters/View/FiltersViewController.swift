//
//  FiltersViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class FiltersViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: FiltersModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: FiltersPresenterInput
    
    // MARK: - UI properties
    
    private let filtersView: FiltersView = .init()
    
    // MARK: - Initialization
    
    init(presenter: FiltersPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = filtersView
        filtersView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchAllSexes()
        presenter.fetchAllWho()
    }
}

// MARK: - FiltersModuleInput

extension FiltersViewController: FiltersModuleInput {}

// MARK: - Public methods

extension FiltersViewController {}

// MARK: - FiltersViewDelegate

extension FiltersViewController: FiltersViewDelegate {
    func didTapView() {
        output?.closeFilters()
    }
}

// MARK: - FiltersPresenterOutput

extension FiltersViewController: FiltersPresenterOutput {
    func didSuccessWho(allWho: [Who]) {
        filtersView.set(allWho: allWho)
    }
    
    func didSuccessFetch(allSexes: [Sex]) {
        filtersView.set(allSexes: allSexes)
    }
}
