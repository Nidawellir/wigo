//
//  EventDescriptionPresenterInput.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import Foundation

protocol EventDescriptionPresenterInput {
    var videoURL: URL? { get }
    
    func set(videoURL: URL)
    func fetchThumbnailImage()
    func fetchEventFilter()
}
