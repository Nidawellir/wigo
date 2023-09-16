//
//  MainScreanViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class MainScreanViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: MainScreanModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: MainScreanPresenterInput
    
    // MARK: - UI properties
    
    private let mainScreanView: MainScreanView = .init()
    
    // MARK: - Initialization
    
    init(presenter: MainScreanPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = mainScreanView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchFilterViewModls()
        presenter.fetchMatchingFiltersModels()
    }
}

// MARK: - MainScreanModuleInput

extension MainScreanViewController: MainScreanModuleInput {}

// MARK: - Public methods

extension MainScreanViewController {}

// MARK: - MainScreanPresenterOutput

extension MainScreanViewController: MainScreanPresenterOutput {
    func didFetchMatchingFilter(viewModels: [MatchingFiltersCollectionViewCell.ViewModel]) {
        mainScreanView.setMatchingFilters(viewModel: viewModels)
        
        print("222222 \(viewModels)")
    }
    
    func didFetchFilter(viewModels: [FilterCollectionViewCell.ViewModel]) {
        mainScreanView.setFilters(viewModels: viewModels)
        
        
    }
}
