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
    
    deinit {
        if self.disposable != nil {
            _ = DisposeBag(disposing: self.disposable!)
        }
        
    }
}
