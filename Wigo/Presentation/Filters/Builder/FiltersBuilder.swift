//
//  FiltersBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum FiltersBuilder {
    static func build(with output: FiltersModuleOutput? = nil) -> (UIViewController, FiltersModuleInput) {
        let presenter = FiltersPresenter()
        let viewController = FiltersViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
