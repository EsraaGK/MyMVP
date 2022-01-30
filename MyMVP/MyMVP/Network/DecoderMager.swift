//
//  DecoderMager.swift
//  MyMVP
//
//  Created by Esraa on 17/12/2021.
//

import Foundation
import Moya


public typealias CompletionResult =  Result< Moya.Response, Moya.MoyaError>

class DecoderManger {
	static let provider = DecoderManger()
	private init() {}

	func decodeResult<T: Codable>(result: CompletionResult) -> Result< T, AppError> {
		switch result {
		case .success(let respose):
			do {
				let resposeModel = try JSONDecoder().decode(T.self, from : respose.data)
				return Result.success(resposeModel)

			} catch let err { // need to map the error
				return Result.failure(AppError(status: respose.statusCode, message: err.localizedDescription))
			}

		case .failure(let error):
			return Result.failure(AppError(status: error.errorCode, message: error.errorDescription))
		}
	}
}

