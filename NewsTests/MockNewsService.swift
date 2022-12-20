//
//  MockNewsService.swift
//  NewsTests
//
//  Created by Vinicius Andrade on 2022-12-20.
//

@testable import News

class MockNewsService: Service {
    
    var expectedError: CustomError?
    
    func searchArticles(query: String, completionHandler: @escaping (Result<News.FullNewsModel, News.CustomError>) -> Void) {
        if let error = expectedError {
            completionHandler(.failure(error))
        } else {
            completionHandler(.success(FullNewsModel(empty: (query == "empty"))))
        }
    }
    
}
