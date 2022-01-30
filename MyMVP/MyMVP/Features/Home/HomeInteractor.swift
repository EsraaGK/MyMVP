//
//  HomeInteractor.swift
//  MyMVP
//
//  Created by Esraa on 08/12/2021.
//

import Foundation
import Moya

class HomeInteractor {
	var presenter: HomePersenterProtocol?

	required init(presenter: HomePersenterProtocol?){
		self.presenter = presenter
	}
}

extension HomeInteractor: HomeInteractorProtocol {
	
	func getCompanies() {
		NetworkManager.shared.request(.getQueizQuestions) { [weak self ] (result: Result<Quiz, AppError>) in
			guard let self = self else { return }
			switch result {
			case .success(let quiz): self.presenter?.update(with: quiz)

			case .failure(let error): self.presenter?.showError(with: error.localizedDescription)
			}
		}
	}
}

