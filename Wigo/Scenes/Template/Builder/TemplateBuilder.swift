//
//  TemplateBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum TemplateBuilder {
    static func build() -> UIViewController {
        let presenter = TemplatePresenter()
        let viewController = TemplateViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
