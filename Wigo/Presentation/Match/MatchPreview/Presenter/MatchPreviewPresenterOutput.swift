//
//  MatchPreviewPresenterOutput.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import Foundation

protocol MatchPreviewPresenterOutput: AnyObject {
    func didFetch(videoURL: URL)
}
