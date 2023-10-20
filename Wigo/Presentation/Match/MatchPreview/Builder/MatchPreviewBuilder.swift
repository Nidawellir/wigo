//
//  MatchPreviewBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum MatchPreviewBuilder {
    static func build(with output: MatchPreviewModuleOutput? = nil) -> (UIViewController, MatchPreviewModuleInput) {
        let presenter = MatchPreviewPresenter()
        let viewController = MatchPreviewViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
