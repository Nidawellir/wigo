//
//  EventDescriptionModuleOutput.swift
//  Wigo
//
//  Created by Apple User on 8/24/23.
//

import Foundation

protocol EventDescriptionModuleOutput: AnyObject {
    func closeEventDescriptionMatch()
    func openPreviewVideo(with videoURL: URL)
    func openCompletedSendRequest()
}
