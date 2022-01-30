//
//  QuestionTableViewCell.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
	@IBOutlet weak var answerLabel: UILabel!
	@IBOutlet weak var boarderView: UIView!
	private var isCorrect = false

	

	public func configure(with answerName: String , isCorrect: Bool ) {
		answerLabel.text = answerName
		self.isCorrect = isCorrect
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		if selected {
			boarderView.borderColor = isCorrect ? .green : .red
		} else {
			boarderView.borderColor = .white
		}
	}
	override func prepareForReuse() {
		super.prepareForReuse()
		boarderView.borderColor = .white
	}
}
