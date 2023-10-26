//
//  EventDescriptionViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class EventDescriptionViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: EventDescriptionModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: EventDescriptionPresenterInput
    
    // MARK: - UI properties
    
    private let eventDescriptionView: EventDescriptionView = .init()
    
    // MARK: - Initialization
    
    init(presenter: EventDescriptionPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        eventDescriptionView.delegate = self
        
        view = eventDescriptionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchThumbnailImage()
        presenter.fetchEventFilter()
        
        eventDescriptionView.segmentControllBackground()
    }
}

// MARK: - EventDescriptionModuleInput

extension EventDescriptionViewController: EventDescriptionModuleInput {
    func getGeolocation(longitude: Double, latitude: Double, address: String) {
        eventDescriptionView.setGeolocation(longitude: longitude, latitude: latitude, address: address)
    }
    
    func set(videoURL: URL) {
        presenter.set(videoURL: videoURL)
    }
    
    func didFetchEventFilters(viewModel: [EventFiltersCollectionViewCell.ViewModel]) {
        eventDescriptionView.setEventFilters(viewModel: viewModel)
    }
}

// MARK: - EventDescriptionPresenterOutput

extension EventDescriptionViewController: EventDescriptionPresenterOutput {
    func didFetch(thumbnailImage: UIImage) {
        eventDescriptionView.set(thumbnailImage: thumbnailImage)
    }
}

// MARK: - EventDescriptionViewDelegate

extension EventDescriptionViewController: EventDescriptionViewDelegate {
    func openMeetingPoint() {
        output?.openMeetingPoint()
    }
    
    func openCompletedSendRequest() {
        output?.openCompletedSendRequest()
    }
    
    func didTapBackButton() {
        output?.closeEventDescriptionMatch()
    }
    
    func didTapThumbnailView() {
        guard let videoURL = presenter.videoURL else { return }
        
        output?.openPreviewVideo(with: videoURL)
    }
}
