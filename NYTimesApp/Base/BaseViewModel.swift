//
//  BaseViewModel.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import Foundation
import RxSwift

class BaseViewModel {
    var disposable: Disposable?
    var disposeBag: DisposeBag


    init() {
        disposeBag = DisposeBag()

    }
    
//    func handelError(_ error: AppError, view: BaseViewProtocol?) {
////         view?.showAlert(title: nil, message: error.message ?? "")
//         switch error.errorType {
//         case .noConnection :
//             view?.showScreenNoConnection()
//         case .unauthorized : // handel error for unauthorized
//             view?.showLogin()
//         case .internalServerError :
//            view?.showErrorAlert(error: error.message ?? "")
//         default:
//             view?.showBlockScreenWithRetry()
//         }
//     }
    
    deinit {
           if self.disposable != nil {
               _ = DisposeBag(disposing: self.disposable!)
           }
           
       }
}
