//
//  SearchViewModel.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import Foundation
import UIKit

protocol SearchViewDelegate {
    func show(articles : [Article])
    func empty()
}

class SearchViewModel {
    
    var viewDelegate: SearchViewDelegate?
    var newsService: Service = NewsService()
    
    func didLoad() {
    }
    
    func search(query: String) {
        getArticles(query: query)
    }
    
    //MARK: Private
    
    private func getArticles(query: String) {
        newsService.searchArticles(query: query) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let news):
                if news.articles.count > 0 {
                    self.viewDelegate?.show(articles: news.articles)
                } else {
                    self.viewDelegate?.empty()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
