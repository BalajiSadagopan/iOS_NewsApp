//
//  FetchData.swift
//  HotNews
//
//  Created by Balaji Sadagopan
//  Copyright © 2021 Balaji Sadagopan. All rights reserved.
//
// Parsing the API Data


import Foundation

class FetchData {
    // Please switch between API once you reached limits
    let apiKey = "416a679ac2cf492d941fb7b55757d24b"
    //let apiKey = "b18a5f797c9b415a8dffd864df0e8fe6"
    func getArticles(for urlString: String, with page: Int, completion: @escaping ([Article]?, Int) -> ()) {
        print("Parsing Data")
        let newsURL = getNewsURL(for: urlString,with: page)
        if let url = URL(string: newsURL) {
            let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
            URLSession.shared.dataTask(with: request)  { data, response, error in
                if let error = error {
                    print("Error in request: \(error.localizedDescription)")
                    completion(nil,0)
                } else if let data = data {
                    do {
                        let rainCheck = try JSONDecoder().decode(Payload.self, from: data)
                        print("Status = \(rainCheck.status), Total results: \(rainCheck.totalResults)")
                        let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
                        completion(articleList.articles,rainCheck.totalResults)
                    } catch {
                        print("Error in JSON decoding : \(String(describing: error))")
                        completion(nil,0)
                    }
                }
                print("Data Parsing Completed")
            }.resume()
        }
    }
}
// MARK: - Get URL for news items
extension FetchData {
    func getNewsURL(for newsItem: String, with page: Int) -> String {
        var newsURL = String()
        let validatedNewsItem = newsItem.replacingOccurrences(of: " " , with: "-").lowercased()
        if validatedNewsItem.contains("q=") {
            newsURL = "https://newsapi.org/v2/everything?"+validatedNewsItem+"&sortBy=publishedAt&language=en&page="+String(page)+"&apiKey="+apiKey
        } else {
            newsURL = "https://newsapi.org/v2/top-headlines?"+validatedNewsItem+"&country=au&page="+String(page)+"&apiKey="+apiKey
        }
        print("News API URL : \(String(describing: newsURL))")
        return newsURL
    }
}
