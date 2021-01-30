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
            self.bindNewsViewModelToController()
        }
    }
    
    var bindNewsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        
        fetchPopularNews().subscribe(){ completable in
            switch completable {
            case .completed:
                print("Completed with no error")
            case .error(let error):
                print("Completed with an error: \(error.localizedDescription)")
            }
        }.disposed(by: disposeBag)
        
    }
    func fetchPopularNews() -> Completable {
        return .create { observer in
            NetworkManager.shared.getNews(period: 7)
                .subscribe(onSuccess: { [weak self]results in
                    self?.newsData = results
                    observer(.completed)
                }, onError: { error in
                    // there was an error fetching the news
                    observer(.error(error))
                })
            
        }
    }
    
}
