//
//  AuthenticationRequest.swift
//  Wigo
//
//  Created by Apple User on 10/3/23.
//

enum AuthenticationRequest {
    case registration(uuid: String, appleID: String, phoneNumber: String)
}
 
// MARK: - TestAppiRequest

extension AuthenticationRequest: TestAppiRequest {
    var httpMethod: CNPHttpMethod {
        switch self {
        case .registration:
            return .post
        }
    }
    
    var queryItems: [String : String]? {
        switch self {
        case .registration:
            return [:]
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .registration:
            return [:]
        }
    }
    
    var httpBody: [String : Any]? {
        switch self {
        case .registration(let uuid, let appleID, let phoneNumber):
            return [
                "id": 0,
                "jsonrpc": "2.0",
                "method": "register",
                "params": [
                    "ru",
                    uuid,
                    appleID,
                    phoneNumber
                ]
            ]
        }
    }
}
