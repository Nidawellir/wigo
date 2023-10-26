//
//  MatchDescriptionPresenterInput.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit
import Foundation

protocol MatchDescriptionPresenterInput {
    var videoURL: URL? { get }
    
    func set(videoURL: URL)
    func fetchThumbnailImage()
    func imageFromVideo(at time: TimeInterval) -> UIImage?
}
