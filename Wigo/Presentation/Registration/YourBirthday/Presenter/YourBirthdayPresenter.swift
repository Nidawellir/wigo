//
//  YourBirthdayPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class YourBirthdayPresenter {
    
    // MARK: - Public properties
    
    weak var output: YourBirthdayPresenterOutput?
    
    // MARK: - Private properties
    
}

// MARK: - YourBirthdayPresenterInput

extension YourBirthdayPresenter: YourBirthdayPresenterInput {
    func fetchBirthday(for yourBirthday: String) {
        print(yourBirthday)
    }
}
