//
//  EventDescriptionBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum EventDescriptionBuilder {
    static func build(with output: EventDescriptionModuleOutput? = nil) -> (UIViewController, EventDescriptionModuleInput) {
        let presenter = EventDescriptionPresenter()
        let viewController = EventDescriptionViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
