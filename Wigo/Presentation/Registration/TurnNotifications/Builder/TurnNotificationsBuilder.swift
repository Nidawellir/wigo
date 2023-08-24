//
//  TurnNotificationsBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum TurnNotificationsBuilder {
    static func build(with output: TurnNotificationsModuleOutput? = nil) -> (UIViewController, TurnNotificationsModuleInput) {
        let presenter = TurnNotificationsPresenter()
        let viewController = TurnNotificationsViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
