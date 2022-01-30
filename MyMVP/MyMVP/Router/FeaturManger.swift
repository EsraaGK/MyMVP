//
//  FeaturManger.swift
//  MyMVP
//
//  Created by Esraa on 15/12/2021.
//

import Foundation

class FeaturManger {
	public static func createHomeFeature(delegate: HomeCoordinnatorDelegate?) -> HomeViewController {
		let viewController = HomeViewController()
		let presenter = HomePresenter(view: viewController, delegate: delegate)
		viewController.presenter = presenter
		return viewController
	}

	public static func createDetailsFeature(delegate: QuestionSceneCoordinnatorDelegate?, with quiz: Quiz) -> QuestionViewController {
		let viewController = QuestionViewController()
		let presenter = QuestionScenePresenter(view: viewController, delegate: delegate, quiz: quiz)
		viewController.presenter = presenter
		return viewController
	}
}
