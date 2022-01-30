//
//  Protocols.swift
//  MyMVP
//
//  Created by Esraa on 08/12/2021.
//

import Foundation


protocol HomeViewProtocol: AnyObject {
    var presenter: HomePersenterProtocol? { get }
    
    func getCompanies()
    
    func update(with quiz: Quiz)
    func showError(with message: String?)
}

protocol HomePersenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get }
    var interactor: HomeInteractorProtocol? { get }
	var delegate: HomeCoordinnatorDelegate? { get }
    init(view: HomeViewProtocol, delegate: HomeCoordinnatorDelegate?)
    
    func getQuiz()
	func gethighestScore() -> String?
	func ShowDetails(for quiz: Quiz)
    func update(with quiz: Quiz)
    func showError(with message: String?)
}

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePersenterProtocol? { get }
    
    init(presenter: HomePersenterProtocol?)
    
    func getCompanies()
}
