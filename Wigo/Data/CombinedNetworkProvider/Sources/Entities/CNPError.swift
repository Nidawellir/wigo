//
//  CNPError.swift
//  Acty
//
//  Created by e.kapanov on 20.06.2023.
//

enum CNPError: Error {
    case requestWasNotCreated
    case beforeMiddlewareFailed
    case afterMiddlewareFailed
    case dataIsEmpty
    case system(error: Error)
    case network(error: CNPNetworkError)
    case decoding(error: Error)
}
