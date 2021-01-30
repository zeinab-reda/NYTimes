//
//  Constants.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import Foundation

struct K {
    struct ProductionServer {
        static let baseApiURL = "https://api.nytimes.com/svc/mostpopular/v2/"
        static let apiKey = "zK8wmak0ztjH2ZuguGztaWVxtU1wtBuD"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
enum ContentType: String {
    case json = "application/json"
    case form = "application/x-www-form-urlencoded"
    
}
