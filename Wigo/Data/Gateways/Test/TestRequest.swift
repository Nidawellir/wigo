//
//  TestRequest.swift
//  Wigo
//
//  Created by Apple User on 9/28/23.
//

enum TestRequest {
    case firstRequest(firstParam: String, secondParam: Bool)
}

// MARK: - BaseRequest

extension TestRequest: BaseRequest {
    var path: String {
        switch self {
        case .firstRequest:
            return "/api/v1/test"
        }
    }
    
    var httpMethod: CNPHttpMethod {
        switch self {
        case .firstRequest:
            return .post
        }
    }
    
    var queryItems: [String: String]? {
        switch self {
        case .firstRequest(let firstParam, _):
            return [
                "asdfadsfsadgdgasd": firstParam
            ]
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .firstRequest:
            return [
                "test": "asdfsaf"
            ]
        }
    }
    
    var httpBody: [String: Any]? {
        switch self {
        case .firstRequest(_, let secondParam):
            return [
                "phone": secondParam
            ]
        }
    }
}
