//
//  MatchPreviewPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import Foundation

final class MatchPreviewPresenter {
    
    // MARK: - Public properties
    
    weak var output: MatchPreviewPresenterOutput?
}

// MARK: - MatchPreviewPresenterInput

extension MatchPreviewPresenter: MatchPreviewPresenterInput {
    func set(videoURL: URL) {
        output?.didFetch(videoURL: videoURL)
    }
}
