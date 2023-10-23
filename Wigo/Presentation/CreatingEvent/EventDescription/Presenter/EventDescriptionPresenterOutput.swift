//
//  EventDescriptionPresenterOutput.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

protocol EventDescriptionPresenterOutput: AnyObject {
    func didFetch(thumbnailImage: UIImage)
    func didFetchEventFilters(viewModel: [EventFiltersCollectionViewCell.ViewModel])
}
