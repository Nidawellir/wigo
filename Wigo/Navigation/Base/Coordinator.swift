//
//  File.swift
//  
//
//  Created by Aleksey Fedororv on 16.08.2023.
//

public protocol Coordinator: AnyCoordinator {
    associatedtype Input
    associatedtype Output
    
    func start(with input: Input, completionHandler: @escaping (Output) -> Void)
}
