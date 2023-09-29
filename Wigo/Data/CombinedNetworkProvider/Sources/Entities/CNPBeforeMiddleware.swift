//
//  CNPBeforeMiddleware.swift
//  Acty
//
//  Created by Евгений Капанов on 05.07.2023.
//

import Combine
import Foundation

protocol CNPBeforeMiddleware {
    func execute(urlRequest: URLRequest, cnpRequest: CNPRequest) -> AnyPublisher<URLRequest, CNPError>
}
