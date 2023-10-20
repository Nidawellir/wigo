//
//  VideoPreviewBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum VideoPreviewBuilder {
    static func build(with output: VideoPreviewModuleOutput? = nil) -> (UIViewController, VideoPreviewModuleInput) {
        let presenter = VideoPreviewPresenter()
        let viewController = VideoPreviewViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
