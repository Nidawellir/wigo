//
//  MeetingPointBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum MeetingPointBuilder {
    static func build(with output: MeetingPointModuleOutput? = nil) -> (UIViewController, MeetingPointModuleInput) {
        let presenter = MeetingPointPresenter()
        let viewController = MeetingPointViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
