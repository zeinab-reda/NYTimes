//
//  APIClient.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import Moya

enum API {
    case getNews(period: Int)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string:K.ProductionServer.baseApiURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case let .getNews(period: period):
            return "viewed/\(period).json"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getNews:
            return .requestParameters(parameters: ["api-key": K.ProductionServer.apiKey], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]

    }
}


