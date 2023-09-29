//
//  MainScreanCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/31/23.
//

import UIKit

final class MainScreanCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var mainScreanModuleInput: MainScreanModuleInput?
    private weak var filtersModuleInput: FiltersModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let intro: UIViewController
        
        (intro, mainScreanModuleInput) = MainScreanBuilder.build(with: self)
        
        navigationController.viewControllers = [intro]
    }
}

// MARK: - IntroModuleOutput

extension MainScreanCoordinator: MainScreanModuleOutput {
    func openFilter() {
        let filtersViewController: UIViewController
        
        (filtersViewController, filtersModuleInput) = FiltersBuilder.build(with: self)
        
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.present(filtersViewController, animated: false)
    }
    
    func openVideoOnboarding() {
        
    }
}

// MARK: - FiltersModuleOutput

extension MainScreanCoordinator: FiltersModuleOutput {
    func closeFilters() {
        navigationController.dismiss(animated: false)
    }
}
