//
//  HomeCoordinator.swift
//  MyMVP
//
//  Created by Esraa on 15/12/2021.
//

import UIKit

class HomeCoordinnator {
    private let navigationController: UINavigationController
    var detailsCoordinator: Coordinator?
	weak var delegate: HomeCoordinnatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension HomeCoordinnator: Coordinator {
    func start() {
		navigationController.viewControllers = [FeaturManger.createHomeFeature(delegate: self)]
    }
}
extension HomeCoordinnator: HomeCoordinnatorDelegate {
	func showQuiz(for quiz:  Quiz) {
		detailsCoordinator = DetailsCoordinator(navigationController: navigationController, quiz: quiz)
		detailsCoordinator?.start()
	}
}

public protocol HomeCoordinnatorDelegate: AnyObject {
	func showQuiz(for quiz: Quiz)
}
