//
//  TurnNotificationsBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum TurnNotificationsBuilder {
    static func build() -> UIViewController {
        let presenter = TurnNotificationsPresenter()
        let viewController = TurnNotificationsViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
