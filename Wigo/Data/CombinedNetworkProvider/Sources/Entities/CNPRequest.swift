//
//  CNPRequest.swift
//  Acty
//
//  Created by e.kapanov on 20.06.2023.
//

import Foundation

protocol CNPRequest {
    var host: String { get }
    var path: String { get }
    var httpMethod: CNPHttpMethod { get }
    var queryItems: [String: String]? { get }
    var headers: [String: String]? { get }
    var httpBody: [String: Any]? { get }
    
    func makeURLRequest() -> URLRequest?
}

// MARK: - Public methods

extension CNPRequest {
    func makeURLRequest() -> URLRequest? {
        guard var urlComponents = URLComponents(string: host + path) else { return nil }
        
        urlComponents.queryItems = queryItems?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        
        headers?.forEach { key, value in urlRequest.setValue(value, forHTTPHeaderField: key) }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        
        if let httpBody = httpBody, JSONSerialization.isValidJSONObject(httpBody) {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: httpBody)
            } catch {
                return nil
            }
        }
        
        return urlRequest
    }
}
