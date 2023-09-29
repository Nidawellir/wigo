//
//  CombinedNetworkProvider.swift
//  Acty
//
//  Created by e.kapanov on 20.06.2023.
//

import Combine

protocol CombinedNetworkProvider {
    func execute<T: Decodable>(request: CNPRequest) -> AnyPublisher<T, CNPError>
    func set(beforeMiddleware: CNPBeforeMiddleware)
    func set(afterMiddleware: CNPAfterMiddleware)
}
