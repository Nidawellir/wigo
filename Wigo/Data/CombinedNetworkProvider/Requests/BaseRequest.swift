//
//  BaseRequest.swift
//  Acty
//
//  Created by e.kapanov on 21.06.2023.
//

protocol BaseRequest: CNPRequest {}

// MARK: - Basic implementation

extension BaseRequest {
    var host: String {
        return "http://188.244.38.135:5000"
    }
}
