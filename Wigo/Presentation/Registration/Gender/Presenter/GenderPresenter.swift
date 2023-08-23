//
//  GenderePresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class GenderePresenter {
    
    // MARK: - Public properties
    
    weak var output: GenderePresenterOutput?
    
    // MARK: - Private properties
    
}

// MARK: - GenderePresenterInput

extension GenderePresenter: GenderePresenterInput {
    func feathYourGender(for gender: String) {
        print(gender)
    }
}
