//
//  NewsTests.swift
//  NewsTests
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import XCTest
@testable import News

final class NewsTest: XCTestCase {
    
    enum Delegates {
        case success
        case empty
    }
    
    let timeInterval: Double = 5
    let viewModel = SearchViewModel()
    var onDelegateHit: ((Delegates) -> Void)?
    
    override func setUpWithError() throws {
        viewModel.viewDelegate = self
     }
    
    func testAPISuccess() throws {
        let expectation = self.expectation(description: "Wait for delegate")
        
        let mockService = MockNewsService()
        viewModel.newsService = mockService
        
        onDelegateHit = { hit in
            switch hit {
            case .success:
                expectation.fulfill()
            default:
                break
            }
        }
        
        viewModel.search(query: "query")
        
        waitForExpectations(timeout: timeInterval, handler: nil)
    }
    
    func testAPIEmpty() throws {
        let expectation = self.expectation(description: "Wait for delegate")
        
        let mockService = MockNewsService()
        viewModel.newsService = mockService
        
        onDelegateHit = { hit in
            switch hit {
            case .empty:
                expectation.fulfill()
            default:
                break
            }
        }
        
        viewModel.search(query: "empty")
        
        waitForExpectations(timeout: timeInterval, handler: nil)
    }
    
}

extension NewsTest: SearchViewDelegate {
    
    func show(articles: [News.Article]) {
        onDelegateHit?(.success)
    }
    
    func empty() {
        onDelegateHit?(.empty)
    }
    
}
