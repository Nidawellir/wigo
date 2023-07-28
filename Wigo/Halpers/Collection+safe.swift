//
//  Collection+safe.swift
//  Wigo
//
//  Created by Apple User on 7/28/23.
//

extension Collection {
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
