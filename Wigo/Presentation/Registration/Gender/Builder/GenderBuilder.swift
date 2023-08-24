//
//  GendereBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum GenderBuilder {
    static func build(with output: GenderModuleOutput? = nil) -> (UIViewController, GenderModuleInput) {
        let presenter = GenderePresenter()
        let viewController = GendereViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
