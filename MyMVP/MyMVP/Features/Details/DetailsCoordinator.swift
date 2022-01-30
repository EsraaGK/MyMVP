//
//  Details.swift
//  MyMVP
//
//  Created by Esraa on 15/12/2021.
//

import UIKit

class DetailsCoordinator: Coordinator {
	private let navigationController: UINavigationController
	var thirdVCCordinator: Coordinator?
	var quiz: Quiz

	init(navigationController: UINavigationController, quiz: Quiz) {
		self.navigationController = navigationController
		self.quiz = quiz
	}
	
	func start() {
		navigationController.pushViewController(FeaturManger.createDetailsFeature(delegate: self, with: quiz), animated: true)
	}
}
protocol QuestionSceneCoordinnatorDelegate {
	func ShowHome()
}

extension DetailsCoordinator: QuestionSceneCoordinnatorDelegate {
	func ShowHome() {
		navigationController.popViewController(animated: true)
	}
}
