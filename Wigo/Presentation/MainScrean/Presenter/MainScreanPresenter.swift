//
//  MainScreanPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import Combine

final class MainScreanPresenter {
    
    // MARK: - Public properties
    
    weak var output: MainScreanPresenterOutput?
    
    // MARK: - Private properties
    
    private var cancellableSet: Set<AnyCancellable> = []
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
    
    private let videoCardModels: [VideoCardView.ViewModel] = [
        .init(name: "Zahar", description: "Привет", location: "У себя дома", timeToUser: "1 мин", videoFileName: "wild", videoFormatName: "mp4", matchingFilters: ["sdadsada", "sadaddsd", "dadaad", "dsadas"]),
        .init(name: "Olegsey", description: "Привет", location: "За спиной", timeToUser: "5 мин", videoFileName: "wild", videoFormatName: "mp4", matchingFilters: ["sdadsada", "sadaddsd", "dadaad", "dsadas"]),
        .init(name: "Daria", description: "Привет, меня зовут даша, приглашаю тебя на свою вечеринку", location: "Дома", timeToUser: "5 мин", videoFileName: "wild", videoFormatName: "mp4", matchingFilters: ["sdadsada", "sadaddsd", "dadaad", "dsadas"]),
    ]
}

// MARK: - MainScreanPresenterInput

extension MainScreanPresenter: MainScreanPresenterInput {
    func fetchVideoCardModels() {
        output?.didFetcVideoCard(viewModel: videoCardModels)
    }
    
    func fetchFilterViewModls() {
//        let test: TestGateway = GatewaysFactory.shared.resolve()
//        
//        test.makeTestGateway().sink(receiveCompletion: { completion in
//            print(completion)
//        }, receiveValue: { decodableStruct in
//            print(decodableStruct)
//        })
//        .store(in: &cancellableSet)
        
        output?.didFetchFilter(viewModels: filterViewModel)
    }
}
