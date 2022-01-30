//
//  PresistanceManger.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import Foundation

class PersistenceService {

	private let defaults =  UserDefaults()
	static let shared = PersistenceService()

	private init() {}
	enum Keys: String {
		case highestScore
	}


	func persist(highestScore: String) {
		defaults.set(highestScore, forKey: Keys.highestScore.rawValue)
	}

	func getHighestScore() -> String {
		return defaults.string(forKey: Keys.highestScore.rawValue) ?? "0" 
	}
}
