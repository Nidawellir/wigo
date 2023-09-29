//
//  FiltersPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class FiltersPresenter {
    
    // MARK: - Public properties
    
    weak var output: FiltersPresenterOutput?
    
    // MARK: - Private properties
    
    private let allSexes: [Sex] = [.man, .woman, .any]
    private var selectedSex: Sex?
}

// MARK: - FiltersPresenterInput

extension FiltersPresenter: FiltersPresenterInput {
    func fetchAllSexes() {
        output?.didSuccessFetch(allSexes: allSexes)
    }
}
