//
//  HomePresenter.swift
//  MyMVP
//
//  Created by Esraa on 08/12/2021.
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
	var delegate: HomeCoordinnatorDelegate?
	
    required init(view: HomeViewProtocol, delegate: HomeCoordinnatorDelegate?) {
        self.view = view
		self.delegate = delegate
        interactor = HomeInteractor(presenter: self)
    }
}

extension HomePresenter: HomePersenterProtocol {
	func ShowDetails(for quiz: Quiz) {
		delegate?.showQuiz(for: quiz)
	}

	func update(with quiz: Quiz) {
		view?.update(with: quiz)
	}

    func getQuiz() {
        interactor?.getCompanies()
    }

	func gethighestScore() -> String? {
		PersistenceService.shared.getHighestScore()
	}

    func showError(with message: String?) {
        view?.showError(with: message)
    }
    
}
