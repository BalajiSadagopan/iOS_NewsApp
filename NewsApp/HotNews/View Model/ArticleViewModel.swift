//
//  ArticleViewModel.swift
//  HotNews
//
//  Created by Balaji Sadagopan
//  Copyright © 2021 Balaji Sadagopan. All rights reserved.
//

import Foundation

class ListViewModel {
    private var articles: [Article] = []
    private var totalArticles: Int = 0
}
extension ListViewModel {
    convenience init(_ newArticles: [Article], totalArticles: Int) {
        self.init()
        articles.append(contentsOf: newArticles)
        self.totalArticles = totalArticles
    }
    var SectionCount: Int {
        return 1
    }
    func SectionRows(_ section: Int) -> Int {
        return self.articles.count
    }
    func ArticleIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    func add(newArticles: [Article]) {
        articles.append(contentsOf: newArticles)
    }
    func ArticleCount() -> Int {
        return self.totalArticles
    }
}
struct ArticleViewModel {
    private let article: Article
}
extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
extension ArticleViewModel {
    var title: String {
        return article.title
    }
    var description: String? {
        return article.description
    }
    var articleURL: String {
        return article.url
    }
}
