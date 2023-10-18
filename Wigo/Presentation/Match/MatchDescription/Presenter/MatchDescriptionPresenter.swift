//
//  MatchDescriptionPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import AVFoundation
import UIKit

final class MatchDescriptionPresenter {
    
    // MARK: - Public properties
    
    weak var output: MatchDescriptionPresenterOutput?
    
    // MARK: - Private properties
    
}

// MARK: - MatchDescriptionPresenterInput

extension MatchDescriptionPresenter: MatchDescriptionPresenterInput {
    func set(videoURL: URL) {
        makeThumbnailImage(from: videoURL)
    }
    
    private func makeThumbnailImage(from videoURL: URL) {
        let asset = AVAsset(url: videoURL)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
        let startTime = CMTime(value: 0, timescale: 1)

        assetImageGenerator.generateCGImagesAsynchronously(
            forTimes: [NSValue(time: startTime)],
            completionHandler: { [weak self] _, cgImage, _, _, _ in
                guard let cgImage = cgImage else { return }
                
                DispatchQueue.main.async {
                    self?.output?.didFetch(thumbnailImage: UIImage(cgImage: cgImage))
                }
            }
        )
    }
}
