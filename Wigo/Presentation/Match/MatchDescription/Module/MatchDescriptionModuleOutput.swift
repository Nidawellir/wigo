//
//  MatchDescriptionModuleOutput.swift
//  Wigo
//
//  Created by Apple User on 8/24/23.
//

import Foundation

protocol MatchDescriptionModuleOutput: AnyObject {
    func closeMatchDescriptionMatch()
    func openPreviewVideo(with videoURL: URL)
    func openCompletedSendRequest()
}
