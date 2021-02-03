//
//  NYTimesAppTests.swift
//  NYTimesAppTests
//
//  Created by Zeinab Reda on 29/01/2021.
//


@testable import NYTimesApp
import Quick
import Nimble
import OHHTTPStubs
import RxSwift
import RxTest

class NYTimesAppTests: QuickSpec {
    
    override func spec() {
        describe("News List") {
            let viewModel = NewsViewModel()
            beforeEach {
                OHHTTPStubs.setEnabled(true, for: URLSessionConfiguration.default)
                stub(condition: isAbsoluteURLString(K.ProductionServer.baseApiURL + "viewed/7.json?api-key=\(K.ProductionServer.apiKey)")) { _ in
                    let stubPath = OHPathForFile("popular_articles.json", type(of: self))
                    if let stubPath = stubPath {
                        return fixture(filePath: stubPath, status: 200, headers: ["Content-Type": "application/json"])
                    } else {
                        return OHHTTPStubsResponse()
                    }
                }
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
            
            context("test news list module") {
                it("test fetch popular news") {
                    waitUntil { done in
                        
                    viewModel.bindNewsDataResults = {
                            expect(viewModel.newsData?.results?.count).to(equal(20))
                        }
                        done()
                    }
                }
            }
            
            context("test news list module") {
                it("test error value nil") {
                    viewModel.fetchPopularNews()
                    let error = viewModel.error
                    expect(error).toEventually(beNil())
                }
            }

        }
    }
    
}
