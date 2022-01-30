//
//  HomeViewController.swift
//  MyMVP
//
//  Created by Esraa on 07/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
   public var presenter: HomePersenterProtocol?
	var quiz: Quiz?
	@IBOutlet weak var scoreLabel: UILabel!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		scoreLabel.text = "\(presenter?.gethighestScore() ?? "") " + "Punkte"
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter?.getQuiz()

    }
	@IBAction func start(_ sender: Any) {
		guard let quiz = quiz else { return }
		presenter?.ShowDetails(for: quiz)
	}
}



extension HomeViewController: HomeViewProtocol {

    func getCompanies() {
		presenter?.getQuiz()
    }
	func update(with quiz: Quiz) {
		self.quiz = quiz
	}

    func showError(with message: String?) {
        print(message)
    }
}
