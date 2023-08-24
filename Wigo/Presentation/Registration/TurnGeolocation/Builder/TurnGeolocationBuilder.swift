//
//  TurnGeolocationBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum TurnGeolocationBuilder {
    static func build(with output: TurnGeolocationModuleOutput? = nil) -> (UIViewController, TurnGeolocationModuleInpute) {
        let presenter = TurnGeolocationPresenter()
        let viewController = TurnGeolocationViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
