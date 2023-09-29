//
//  TestGateway.swift
//  Wigo
//
//  Created by Apple User on 9/28/23.
//

import Combine

protocol TestGateway {
    func makeTestGateway() -> AnyPublisher<DecodableStruct, CNPError>
}
