//
//  UserDefaultsGatewayImp.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

import Foundation

final class UserDefaultsGatewayImp {
    
    // MARK: - Shared
    
    static let shared: UserDefaultsGateway = UserDefaultsGatewayImp()
    
    // MARK: - Private properties
    
    private let userDefaults: UserDefaults = .standard
    
    // MARK: - Initialization
    
    private init() {}
}

// MARK: - UserDefaultsGateway

extension UserDefaultsGatewayImp: UserDefaultsGateway {
    func save<T>(object: T, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    func load<T>(key: String) -> T? {        
        return userDefaults.object(forKey: key) as? T
    }
}
