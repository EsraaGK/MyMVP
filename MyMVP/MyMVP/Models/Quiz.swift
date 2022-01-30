//
//  Company.swift
//  MyMVP
//
//  Created by Esraa on 08/12/2021.
//

import Foundation

// MARK: - Welcome
public struct Quiz: Codable {
	let questions: [Question]
}

// MARK: - Question
public struct Question: Codable {
	let question: String
	let answers: Answers?
	let questionImageURL: String?
	let correctAnswer: String?
	let score: Int?

	enum CodingKeys: String, CodingKey {
		case question, answers
		case questionImageURL = "questionImageUrl" 
		case correctAnswer, score
	}
	func getCorretAnswerValue() -> String {
		answers?.asDictionary[correctAnswer ?? ""] ?? ""
	}
}

// MARK: - Answers
public struct Answers: Codable {
	let a, b: String?
	let c, d: String?

	 var asDictionary : [String: String] { 
		let mirror = Mirror(reflecting: self)
		let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.compactMap({ (label:String?, value:Any) -> (String, String)? in
		  guard let label = label, let tempString = value as? String else { return nil }
			return (label.uppercased(), tempString)
		}).compactMap { $0 })
		return dict
	 }
	var asArray: [String] {
		asDictionary.compactMap { "\($0.value )"}
	}
	
	enum CodingKeys: String, CodingKey {
		case a = "A"
		case b = "B"
		case c = "C"
		case d = "D"
	}

}
