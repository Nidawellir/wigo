//
//  VideoRecordingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum VideoRecordingBuilder {
    static func build(with output: VideoRecordingModuleOutput? = nil) -> (UIViewController, VideoRecordingModuleInput) {
        let presenter = VideoRecordingPresenter()
        let viewController = VideoRecordingViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
