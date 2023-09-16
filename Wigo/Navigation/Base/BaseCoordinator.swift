//
//  File.swift
//  
//
//  Created by Aleksey Fedorov on 16.08.2023.
//

import UIKit

open class BaseCoordinator<Input, Output>: Coordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [AnyCoordinator] = []
    public var completionHandler: ((Output) -> Void)?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    open func start(with input: Input, completionHandler: @escaping (Output) -> Void) {
        self.completionHandler = completionHandler
    }
}

extension BaseCoordinator {
    public func capture(coordinator: AnyCoordinator) {
        childCoordinators.append(coordinator)
    }
    
    public func decapture(coordinator: AnyCoordinator) {
        for (index, child) in childCoordinators.enumerated() {
            guard child === coordinator else { continue }
            
            childCoordinators.remove(at: index)
            
            break
        }
    }
}
