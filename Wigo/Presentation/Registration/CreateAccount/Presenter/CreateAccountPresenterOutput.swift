//
//  CreateAccountPresenterOutput.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

protocol CreateAccountPresenterOutput: AnyObject {
    func didSuccessFetchCreateAccount()
    func didFailureFetchCreateAccount()
}