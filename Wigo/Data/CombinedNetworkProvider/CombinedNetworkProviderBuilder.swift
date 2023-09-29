//
//  CombinedNetworkProviderBuilder.swift
//  Acty
//
//  Created by Евгений Капанов on 06.07.2023.
//

enum CombinedNetworkProviderBuilder {
    static func build() -> CombinedNetworkProvider {
        let combinedNetworkProvider = CombinedNetworkProviderImp.shared
        
        return combinedNetworkProvider
    }
}
