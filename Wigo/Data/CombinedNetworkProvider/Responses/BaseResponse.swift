//
//  BaseResponse.swift
//  Acty
//
//  Created by e.kapanov on 21.06.2023.
//

struct BaseResponse<T: Codable>: Codable {
    let data: T
    let message: String?
}
