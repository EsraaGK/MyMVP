//
//  CompaniesTargetType.swift
//  MyMVP
//
//  Created by Esraa on 12/12/2021.
//

import Foundation
import Moya

public enum CompaniesTargetType {
    case getQueizQuestions
    case getOffers
}

extension CompaniesTargetType: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: "https://app.check24.de/vg2-quiz/")
        else {fatalError("Base URL Error")}
        return url
    }
    
    public var path: String {
        switch self {
        case .getQueizQuestions: return "quiz.json"
        case .getOffers: return "Offers"
            
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getQueizQuestions: return .get
        case .getOffers: return .get
            
        }
    }
    
    public var task: Task {
        switch self {
        case .getQueizQuestions: return .requestPlain
        case .getOffers: return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
