//
//  CombinedNetworkProviderImp.swift
//  Acty
//
//  Created by e.kapanov on 20.06.2023.
//

import Combine
import Foundation

final class CombinedNetworkProviderImp {
    
    // MARK: - shared
    
    static let shared: CombinedNetworkProvider = CombinedNetworkProviderImp()
    
    // MARK: - Private properties
    
    private let urlSession: URLSession = .shared
    private let jsonDecoder: JSONDecoder = .init()
    private var beforeMiddlewares: [CNPBeforeMiddleware] = []
    private var afterMiddlewares: [CNPAfterMiddleware] = []
}

// MARK: - CombinedNetworkProvider

extension CombinedNetworkProviderImp: CombinedNetworkProvider {
    func execute<T: Decodable>(request: CNPRequest) -> AnyPublisher<T, CNPError> {
        return makeURLRequestPublisher(cnpRequest: request)
            .flatMap { self.executeBeforeMiddlewares(urlRequest: $0, cnpRequest: request) }
            .flatMap { self.resumeDataTask(urlRequest: $0) }
            .flatMap { self.executeAfterMiddlewares(urlRequest: $0, cnpRequest: request, data: $1, urlResponse: $2, error: $3) }
            .flatMap { self.decodeIfPossible(data: $0, urlResponse: $1, error: $2) }
            .eraseToAnyPublisher()
    }
    
    private func makeURLRequestPublisher(cnpRequest: CNPRequest) -> AnyPublisher<URLRequest, CNPError> {
        guard let urlRequest = cnpRequest.makeURLRequest() else { return Fail(error: .requestWasNotCreated).eraseToAnyPublisher() }
        
        return Just(urlRequest).setFailureType(to: CNPError.self).eraseToAnyPublisher()
    }
    
    private func executeBeforeMiddlewares(
        urlRequest: URLRequest,
        cnpRequest: CNPRequest
    ) -> AnyPublisher<URLRequest, CNPError> {
        return beforeMiddlewares.reduce(Just(urlRequest).setFailureType(to: CNPError.self).eraseToAnyPublisher()) { beforeMiddleware, next in
            beforeMiddleware.flatMap { next.execute(urlRequest: $0, cnpRequest: cnpRequest) }.eraseToAnyPublisher()
        }
    }
    
    private func resumeDataTask(
        urlRequest: URLRequest
    ) -> AnyPublisher<(URLRequest, Data?, URLResponse?, Error?), CNPError> {
        return Future() { promise in
            self.urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
                promise(.success((urlRequest, data, urlResponse, error)))
            }.resume()
        }.eraseToAnyPublisher()
    }
    
    private func executeAfterMiddlewares(
        urlRequest: URLRequest,
        cnpRequest: CNPRequest,
        data: Data?,
        urlResponse: URLResponse?,
        error: Error?
    ) -> AnyPublisher<(Data?, URLResponse?, Error?), CNPError> {
        let publisher = Just(()).setFailureType(to: CNPError.self).eraseToAnyPublisher()
        
        return afterMiddlewares.reduce(publisher) { afterMiddleware, next in
            afterMiddleware.flatMap {
                next.execute(
                    urlRequest: urlRequest,
                    cnpRequest: cnpRequest,
                    data: data,
                    urlResponse: urlResponse,
                    error: error
                )
            }
            .eraseToAnyPublisher()
        }
        .map { return (data, urlResponse, error) }
        .eraseToAnyPublisher()
    }
    
    private func decodeIfPossible<T: Decodable>(
        data: Data?,
        urlResponse: URLResponse?,
        error: Error?
    ) -> AnyPublisher<T, CNPError> {
        guard error == nil else { return Fail(error: .system(error: error!)).eraseToAnyPublisher() }

        guard let data = data else { return Fail(error: CNPError.dataIsEmpty).eraseToAnyPublisher() }

        do {
            return Just(try jsonDecoder.decode(T.self, from: data)).setFailureType(to: CNPError.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: CNPError.decoding(error: error)).eraseToAnyPublisher()
        }
    }
    
    func set(beforeMiddleware: CNPBeforeMiddleware) {
        self.beforeMiddlewares.append(beforeMiddleware)
    }
    
    func set(afterMiddleware: CNPAfterMiddleware) {
        self.afterMiddlewares.append(afterMiddleware)
    }
}
