//
//  NewsService.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import Foundation
import Alamofire

protocol Service {
  func searchArticles(query: String, completionHandler: @escaping (Result<FullNewsModel, CustomError>) -> Void)
}

class NewsService: Service {
    
    var weatherUrl = URL(string: "https://newsapi.org/v2/everything")!
    let apiKey = "183daca270264bad86fc5b72972fb82a"
    
    func searchArticles(query: String, completionHandler: @escaping (Result<FullNewsModel, CustomError>) -> Void) {
        
        let parameters: [String: String] = ["q": query,
                                            "apiKey": apiKey]
        
        AF.request(weatherUrl, parameters: parameters)
            .responseDecodable(of: FullNewsModel.self) { response in
                
                let result = response.result
                
                switch result {
                case .success(let value):
                    completionHandler(.success(value))
                case .failure(_):
                    completionHandler(.failure(CustomError.genericError))
                }
                
            }
    }
    
}

