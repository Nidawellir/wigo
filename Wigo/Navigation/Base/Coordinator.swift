//
//  File.swift
//  
//
//  Created by Евгений Капанов on 16.08.2022.
//

public protocol Coordinator: AnyCoordinator {
    associatedtype Input
    associatedtype Output
    
    func start(with input: Input, completionHandler: @escaping (Output) -> Void)
}
