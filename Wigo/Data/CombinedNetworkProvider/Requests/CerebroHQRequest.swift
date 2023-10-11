//
//  BaseRequest.swift
//  Acty
//
//  Created by e.kapanov on 21.06.2023.
//

protocol CerebroHQRequest: CNPRequest {}

// MARK: - Basic implementation

extension CerebroHQRequest {
    var host: String {
        return "http://v2.cerebrohq.com"
    }
    
    var path: String {
        return "/rpc.php"
    }
}
