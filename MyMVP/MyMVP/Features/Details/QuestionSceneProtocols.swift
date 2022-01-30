//
//  QuestionSceneProtocols.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import Foundation


protocol QuestionSceneViewProtocol: AnyObject {
	var presenter: QuestionScenePersenterProtocol? { get }

}

protocol QuestionScenePersenterProtocol: AnyObject {
	var view: QuestionSceneViewProtocol? { get }
	var interactor: QuestionSceneInteractorProtocol? { get }
	var delegate: QuestionSceneCoordinnatorDelegate? { get }
	var quiz: Quiz { get }

	init(view: QuestionSceneViewProtocol, delegate: QuestionSceneCoordinnatorDelegate?, quiz: Quiz )
	func getQuestion() -> Question?
	func getQuestionNumber() -> Int
	func getTotalScore() -> Int
	func getTotalQuestionsNo() -> Int
	func userChoosed(choice: String?) 
}

protocol QuestionSceneInteractorProtocol: AnyObject {
	var presenter: QuestionScenePersenterProtocol? { get }

	init(presenter: QuestionScenePersenterProtocol?)

}


