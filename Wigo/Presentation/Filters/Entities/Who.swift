//
//  Who.swift
//  Wigo
//
//  Created by Apple User on 9/30/23.
//

import Foundation

enum Who {
    case any
    case group
    case oneToOne
}

extension Who {
    var title: String {
        switch self {
        case .any:
            return "Любые"
        case .group:
            return "В группе"
        case .oneToOne:
            return "Один на один"
        }
    }
}
