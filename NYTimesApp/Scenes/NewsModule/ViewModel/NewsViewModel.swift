//
//  NewsViewModel.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import RxSwift

class NewsViewModel : BaseViewModel{
    
    private(set) var newsData : NewsModel! {
        didSet {
            self.bindNewsDataResults()
        }
    }
    private(set) var error : AppError! {
        didSet {
            self.handelErrors()
        }
    }
    
    var bindNewsDataResults : (() -> ()) = {} // closure with data results
    var handelErrors: (() -> ()) = {} // losure with error
    
    override init() {
        super.init()
        fetchPopularNews()
        
    }
    
    // MARK : fetchNews is called network layer and return with data results
    func fetchPopularNews() {
        
        NetworkManager.shared.getNews(period: 7)
            .subscribe(onSuccess: { [weak self]results in
                self?.newsData = results
            }, onError: {[weak self] error in
                // there was an error fetching the news
                self?.error = error as? AppError
            }).disposed(by: disposeBag)
        
    }
    
}
