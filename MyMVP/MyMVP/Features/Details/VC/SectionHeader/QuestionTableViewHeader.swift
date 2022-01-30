//
//  QuestionTableViewHeader.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import UIKit
import Kingfisher

class QuestionTableViewHeader: UITableViewHeaderFooterView {
	
	@IBOutlet weak var scoreLabel: UILabel!
	
	@IBOutlet weak var questionImageView: UIImageView!
	@IBOutlet weak var questionLabel: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
		questionImageView.isHidden = false
	}

	func Configure(with score: Int?, imageUrl: String?, question: String?){
		scoreLabel.text = String(score ?? 0) + " Punkte"
		questionLabel.text = question
		if let stringUrl = imageUrl, let url = URL(string: stringUrl), verifyUrl(urlString: stringUrl){
			questionImageView.isHidden = false
			questionImageView.kf.setImage(with: url, placeholder: UIImage())
		} else {
			questionImageView.isHidden = true
			return
		}

	}
}

extension UITableViewHeaderFooterView {
	static var identifire: String { return String(describing: self) }
	static var nib: UINib { return UINib(nibName: self.identifire, bundle: nil) }
}

func verifyUrl (urlString: String?) -> Bool {
	if let urlString = urlString {
		if let url = NSURL(string: urlString) {
			return UIApplication.shared.canOpenURL(url as URL)
		}
	}
	return false
}
