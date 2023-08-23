//
//  TurnGeolocationBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum TurnGeolocationBuilder {
    static func build() -> UIViewController {
        let presenter = TurnGeolocationPresenter()
        let viewController = TurnGeolocationViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
