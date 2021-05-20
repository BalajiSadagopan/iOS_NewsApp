//
//  ArticleView.swift
//  HotNews
//
//  Created by Balaji Sadagopan
//  Copyright © 2021 Balaji Sadagopan. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ArticleTableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

class NewsWebView: WKWebView {
    @IBOutlet weak var newsWebView: WKWebView!
}

class NewsItemCell: UITableViewCell{
    @IBOutlet weak var newsItem: UILabel!
}
