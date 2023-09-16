//
//  File.swift
//  
//
//  Created by Aleksey Fedorov on 16.08.2023.
//

import UIKit

public protocol AnyCoordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [AnyCoordinator] { get set }
}
