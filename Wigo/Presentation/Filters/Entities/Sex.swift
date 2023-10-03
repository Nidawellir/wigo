//
//  Sex.swift
//  Wigo
//
//  Created by Apple User on 9/29/23.
//

import Foundation

enum Sex {
    case man
    case woman
    case any
}

extension Sex {
    var title: String {
        switch self {
        case .man:
            return "Любые"
        case .woman:
            return "Женщина"
        case .any:
            return "Мужчина"
        }
    }
}
