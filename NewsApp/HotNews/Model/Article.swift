//
//  Article.swift
//  HotNews
//
//  Created by Balaji Sadagopan
//  Copyright © 2021 Balaji Sadagopan. All rights reserved.
//
//  Custom Data Structures


import Foundation

// To store the list of article
struct ArticleList: Decodable {
    let articles: [Article]
}

// To store data about each article
struct Article: Decodable {
    // Declaring optional attributes is must, else might break the code
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}

// To store the API data
struct Payload: Decodable {
    let status: String
    let totalResults: Int
}
