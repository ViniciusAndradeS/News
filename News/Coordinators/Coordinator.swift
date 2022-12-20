//
//  Coordinator.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

