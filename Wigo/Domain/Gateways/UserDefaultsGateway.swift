//
//  UserDefaultsGateway.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

protocol UserDefaultsGateway {
    func save<T>(object: T, key: String)
    func load<T>(key: String) -> T?
}
