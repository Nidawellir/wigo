//
//  MainScreanPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class MainScreanPresenter {
    
    // MARK: - Public properties
    
    weak var output: MainScreanPresenterOutput?
    
    // MARK: - Private properties
    
    private let filterViewModel: [FilterCollectionViewCell.ViewModel] = [
        .init(title: "1gdgdfgdgdg"),
        .init(title: "dsadasda"),
        .init(title: "asd12313"),
        .init(title: "asdad123"),
        .init(title: "asdada"),
        .init(title: "asda123"),
        .init(title: "asdggg11233"),
        .init(title: "asdggg2132"),
        .init(title: "asdggg1231"),
        .init(title: "asdggg1233"),
        .init(title: "asdggg123"),
        .init(title: "asdggg123"),
        .init(title: "asdggg1233"),
        .init(title: "asdggg133"),
    ]
    
    private let matchingFiltersModel: [MatchingFiltersCollectionViewCell.ViewModel] = [
        .init(title: "1gdgdfgdgdg"),
        .init(title: "dsadasda"),
        .init(title: "asd12313"),
        .init(title: "asdad123"),
        .init(title: "asdada"),
        .init(title: "asda123"),
        .init(title: "asdggg11233"),
        .init(title: "asdggg2132"),
        .init(title: "asdggg1231"),
        .init(title: "asdggg1233"),
        .init(title: "asdggg123"),
        .init(title: "asdggg123"),
        .init(title: "asdggg1233"),
        .init(title: "asdggg133"),
    ]
    
    
}

// MARK: - MainScreanPresenterInput

extension MainScreanPresenter: MainScreanPresenterInput {
    func fetchMatchingFiltersModels() {
        output?.didFetchMatchingFilter(viewModels: matchingFiltersModel)
        print("111112\(matchingFiltersModel)")
    }
    
    func fetchFilterViewModls() {
        output?.didFetchFilter(viewModels: filterViewModel)
        print("33333\(filterViewModel)")
    }
}
