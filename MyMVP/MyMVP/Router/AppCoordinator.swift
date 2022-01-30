//
//  AppCoordinator.swift
//  MyMVP
//
//  Created by Esraa on 15/12/2021.
//

import UIKit

class AppCoordinator {

    private let window: UIWindow
    private let navigationController: UINavigationController
    private var homeCoordinator: Coordinator?

	init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        setupWindow()
        setupStarterCoordinator()
    }
        func setupWindow() {
            self.window.rootViewController = navigationController
            self.window.makeKeyAndVisible()
        }

        func setupStarterCoordinator() {
            homeCoordinator = HomeCoordinnator(navigationController: navigationController)
        }
}

extension AppCoordinator: Coordinator {
    func start() {
        homeCoordinator?.start()
    }
}
