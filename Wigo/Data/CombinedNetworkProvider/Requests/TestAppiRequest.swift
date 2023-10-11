//
//  TestAppiRequest.swift
//  Wigo
//
//  Created by Apple User on 10/3/23.
//

protocol TestAppiRequest: CNPRequest {}
    
// MARK: - Basic implementation

extension TestAppiRequest {
    var host: String {
        return "http://v2.cerebrohq.com"
    }
    
    var path: String {
        return "/testapi/rpc.php"
    }
}

