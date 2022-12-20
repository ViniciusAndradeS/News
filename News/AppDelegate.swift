//
//  AppDelegate.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator!.start()
        
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        return true
    }

}
