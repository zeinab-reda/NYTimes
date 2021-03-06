//
//  NetworkManager.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import Moya
import RxSwift

struct NetworkManager {
    static let shared = NetworkManager()
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    func getNews(period: Int) -> Single<NewsModel> {
        
        return provider.rx                              // we use the Reactive component for our provider
            .request(.getNews(period: period))                         // we specify the call
            .filterSuccessfulStatusAndRedirectCodes()   // we tell it to only complete the call if the operation is successful, otherwise it will give us an error
            .map(NewsModel.self)
            .catchError { error in // get error and throw it as custom error
                print(error)
                var appError: AppError = AppError()
                if let moyaError = error as? MoyaError {
                    appError.statusCode = moyaError.response?.statusCode
                    appError.message = moyaError.errorDescription
                }
                throw appError
            }
    }
    
}
