//
//  EventDescriptionPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import AVFoundation
import UIKit

final class EventDescriptionPresenter {
    
    // MARK: - Public properties
    
    weak var output: EventDescriptionPresenterOutput?
    
    var videoURL: URL?
    
    // MARK: - Private properties
    
    private let eventFiltersViewModel: [EventFiltersCollectionViewCell.ViewModel] = [
        .init(title: "Танцы"),
        .init(title: "Кафе"),
        .init(title: "Прогулки"),
        .init(title: "Игры"),
        .init(title: "Концерты"),
        .init(title: "Вписки"),
    ]
}

// MARK: - EventDescriptionPresenterInput

extension EventDescriptionPresenter: EventDescriptionPresenterInput {
    func fetchEventFilter() {
        output?.didFetchEventFilters(viewModel: eventFiltersViewModel)
    }
    
    func set(videoURL: URL) {
        self.videoURL = videoURL
    }
    
    func fetchThumbnailImage() {
        guard let videoURL = videoURL else { return }
        
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
