//
//  CompletedSendRequestBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum CompletedSendRequestBuilder {
    static func build(with output: CompletedSendRequestModuleOutput? = nil) -> (UIViewController, CompletedSendRequestModuleInput) {
        let presenter = CompletedSendRequestPresenter()
        let viewController = CompletedSendRequestViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
