//
//  UITableViewExtension.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import UIKit

extension UITableViewCell {
	static var identifire: String { return String(describing: self) }
	static var nib: UINib { return UINib(nibName: self.identifire, bundle: nil) }
}

