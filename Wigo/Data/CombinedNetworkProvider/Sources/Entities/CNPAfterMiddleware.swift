//
//  CNPAfterMiddleware.swift
//  Acty
//
//  Created by Евгений Капанов on 07.07.2023.
//

import Combine
import Foundation

protocol CNPAfterMiddleware {
    func execute(
        urlRequest: URLRequest,
        cnpRequest: CNPRequest,
        data: Data?,
        urlResponse: URLResponse?,
        error: Error?
    ) -> AnyPublisher<Void, CNPError>
}
