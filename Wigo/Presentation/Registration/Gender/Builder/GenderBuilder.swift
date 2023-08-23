//
//  GendereBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum GenderBuilder {
    static func build() -> UIViewController {
        let presenter = GenderePresenter()
        let viewController = GendereViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
