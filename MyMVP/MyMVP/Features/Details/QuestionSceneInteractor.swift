//
//  QuestionSceneInteractor.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import Foundation

class QuestionSceneInteractor {
	var presenter: QuestionScenePersenterProtocol?
	
	required init(presenter: QuestionScenePersenterProtocol?) {
		self.presenter = presenter
	}
}

extension QuestionSceneInteractor: QuestionSceneInteractorProtocol {

}
