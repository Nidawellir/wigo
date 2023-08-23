//
//  File.swift
//  
//
//  Created by Евгений Капанов on 16.08.2022.
//

import UIKit

public protocol AnyCoordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [AnyCoordinator] { get set }
}
