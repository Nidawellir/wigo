//
//  AuthenticationGateway.swift
//  Wigo
//
//  Created by Apple User on 10/3/23.
//

import Combine

protocol AuthenticationGateway {
    func registration(uuid: String, appleID: String, phoneNumber: String) -> AnyPublisher<DecodableStruct, CNPError>
}
