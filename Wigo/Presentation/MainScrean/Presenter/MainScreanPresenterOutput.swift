//
//  MainScreanPresenterOutput.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

protocol MainScreanPresenterOutput: AnyObject {
    func didFetchFilter(viewModels: [FilterCollectionViewCell.ViewModel])
    func didFetchMatchingFilter(viewModels: [MatchingFiltersCollectionViewCell.ViewModel])
}
