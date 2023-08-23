//
//  YourNamePresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class YourNamePresenter {
    
    // MARK: - Public properties
    
    weak var output: YourNamePresenterOutput?
    
    // MARK: - Private properties
    
}

// MARK: - YourNamePresenterInput

extension YourNamePresenter: YourNamePresenterInput {
    func fetchYourName(for name: String) {
        print(name)
    }
}
