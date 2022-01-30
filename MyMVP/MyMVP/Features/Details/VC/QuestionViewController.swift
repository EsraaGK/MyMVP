//
//  QuestionViewController.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import UIKit

class QuestionViewController: UIViewController {
	var presenter: QuestionScenePersenterProtocol?
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var tableView: UITableView!
	private var question: Question? {
		didSet {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				self.tableView.reloadData()
				self.showScore()
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureTableView()
		question = presenter?.getQuestion()
		showScore()
	}

	private func configureTableView() {
		tableView.dataSource  = self
		tableView.delegate = self
		self.tableView.sectionHeaderHeight = UITableView.automaticDimension
		self.tableView.estimatedSectionHeaderHeight = 73
		tableView.register(QuestionTableViewCell.nib, forCellReuseIdentifier: QuestionTableViewCell.identifire)
		tableView.register(QuestionTableViewHeader.nib, forHeaderFooterViewReuseIdentifier: QuestionTableViewHeader.identifire)
		tableView.tableFooterView = UIView(frame: .zero)
	}

	private func showScore() {
		scoreLabel.text = "Frage \(String(describing: presenter?.getQuestionNumber() ?? 0)) / " +
		"\(String(presenter?.getTotalQuestionsNo() ?? 0)) - Aktual Punketzahl: \(String(presenter?.getTotalScore() ?? 0)) "
	}
}
extension QuestionViewController: QuestionSceneViewProtocol {



}
extension QuestionViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		question?.answers?.asArray.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifire,
													   for: indexPath) as? QuestionTableViewCell
		else { return UITableViewCell() }
		let answer = question?.answers?.asArray[indexPath.row] ?? ""
		cell.configure(with: answer , isCorrect: answer == question?.getCorretAnswerValue())
		return cell
	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: QuestionTableViewHeader.identifire) as? QuestionTableViewHeader

		view?.Configure(with: question?.score, imageUrl: question?.questionImageURL, question: question?.question)
		return view
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return UITableView.automaticDimension
	}

	func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		return 73
	}
}
extension QuestionViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		let choiceValue = (tableView.cellForRow(at: indexPath) as? QuestionTableViewCell)?.answerLabel.text
		presenter?.userChoosed(choice: choiceValue)
		question = presenter?.getQuestion()
	}

}
