//
//  AppCoordinator.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToHomeScreen()
    }
    
    func goToHomeScreen() {
        navigationController.pushViewController(SearchViewController(nibName: "SearchViewController",
                                                                     bundle: nil),
                                                animated: true)
    }
}
