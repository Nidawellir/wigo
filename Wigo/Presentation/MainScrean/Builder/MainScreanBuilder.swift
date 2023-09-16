//
//  MainScreanBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum MainScreanBuilder {
    static func build(with output: MainScreanModuleOutput? = nil) -> (UIViewController, MainScreanModuleInput) {
        let presenter = MainScreanPresenter()
        let viewController = MainScreanViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
