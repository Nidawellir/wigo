//
//  SingleRequest.swift
//  Wigo
//
//  Created by Apple User on 9/28/23.
//

struct SingleRequest {
    private let firstParam: String
    private let secondParam: Bool
    
    init(firstParam: String, secondParam: Bool) {
        self.firstParam = firstParam
        self.secondParam = secondParam
    }
}

extension SingleRequest: BaseRequest {
    var path: String {
        return ""
    }
    
    var httpMethod: CNPHttpMethod {
        return .post
    }
    
    var queryItems: [String : String]? {
        return [:]
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var httpBody: [String : Any]? {
        return [
            "firstParam": firstParam
        ]
    }
    
    
}
