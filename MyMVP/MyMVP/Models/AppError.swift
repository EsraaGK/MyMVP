//
//  AppError.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import Foundation

public struct AppError: Error {
	var status: Int?
	var message: String?
}
