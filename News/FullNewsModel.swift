//
//  FullNewsModel.swift
//  News
//
//  Created by Vinicius Andrade on 2022-12-20.
//

import Foundation

public struct FullNewsModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    init(empty: Bool = false) {
        status = ""
        totalResults = 0
        articles = empty ? [] : [Article(source: nil, author: nil, title: nil, description: nil, url: nil, urlToImage: nil, publishedAt: nil, content: nil)]
    }
}

public struct Article: Decodable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
    let content: String?
}

public struct Source: Decodable {
    let id: String?
    let name: String?
}
