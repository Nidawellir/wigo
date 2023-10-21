//
//  TemplateBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum TemplateBuilder {
    static func build(with output: TemplateModuleOutput? = nil) -> (UIViewController, TemplateModuleInput) {
        let presenter = TemplatePresenter()
        let viewController = TemplateViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
