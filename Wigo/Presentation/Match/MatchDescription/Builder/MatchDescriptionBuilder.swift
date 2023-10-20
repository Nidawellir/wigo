//
//  MatchDescriptionBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum MatchDescriptionBuilder {
    static func build(with output: MatchDescriptionModuleOutput? = nil) -> (UIViewController, MatchDescriptionModuleInput) {
        let presenter = MatchDescriptionPresenter()
        let viewController = MatchDescriptionViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
