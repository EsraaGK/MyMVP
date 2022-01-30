//
//  NetworkManager.swift
//  MyMVP
//
//  Created by Esraa on 12/12/2021.
//

import Foundation
import Moya

class NetworkManager {
	private var provider = MoyaProvider<CompaniesTargetType>()
	public static let shared = NetworkManager()

	private init() {}
	
	func request<T: Codable>(_ target: CompaniesTargetType, completion: @escaping ((Result< T, AppError>)-> Void)) {
		NetworkManager.shared.provider.request(target) { result in
			completion(DecoderManger.provider.decodeResult(result: result))
		}
	}
}
