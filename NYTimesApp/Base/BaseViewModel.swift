//
//  BaseViewModel.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import Foundation
import RxSwift

class BaseViewModel {
    var disposeBag: DisposeBag
    
    
    init() {
        disposeBag = DisposeBag()
        
    }
    
}
