//
//  QuestionScenePresenter.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import Foundation
import AVFoundation

class QuestionScenePresenter {
	var view: QuestionSceneViewProtocol?
	var interactor: QuestionSceneInteractorProtocol?
	var quiz: Quiz
	var delegate: QuestionSceneCoordinnatorDelegate?
	private var currentQuestionNO: Int
	private var currentScore: Int

	required init(view: QuestionSceneViewProtocol, delegate: QuestionSceneCoordinnatorDelegate?, quiz: Quiz ) {
		self.view = view
		self.delegate = delegate
		self.quiz = quiz
		currentQuestionNO = 0
		currentScore = 0
		interactor = QuestionSceneInteractor(presenter: self)
	}
	public func getQuestion() -> Question? {
		guard currentQuestionNO <= quiz.questions.count - 1 else {
			// Game ended    1. update hight score     2. return to First screen

			shouldUpdateHighestScore(with: currentScore)
			delegate?.ShowHome()
			return nil
		}
		let question = quiz.questions[currentQuestionNO]
		currentQuestionNO += 1
		return question
	}
	func getQuestionNumber() -> Int {
		currentQuestionNO
	}
	func getTotalScore() -> Int {
		currentScore
	}
	func getTotalQuestionsNo() -> Int {
		quiz.questions.count
	}

	func userChoosed(choice: String?) {
		if choice == quiz.questions[currentQuestionNO - 1].getCorretAnswerValue() {
			currentScore += (quiz.questions[currentQuestionNO - 1].score ?? 0 )
		}

	}

	private func shouldUpdateHighestScore(with currentScore: Int) {
		let oldScore = Int(PersistenceService.shared.getHighestScore()) ?? 0
		if currentScore > oldScore {
		PersistenceService.shared.persist(highestScore: String(currentScore))
		}
	}
}

extension QuestionScenePresenter: QuestionScenePersenterProtocol {


}
