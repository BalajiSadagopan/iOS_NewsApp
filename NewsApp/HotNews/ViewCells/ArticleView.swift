//
//  ArticleView.swift
//  HotNews
//
//  Created by Balaji Sadagopan
//  Copyright © 2021 Balaji Sadagopan. All rights reserved.
//

// UI Container Formatting

import Foundation
import UIKit
import WebKit


// View for listing all the articles
class TableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

// View for listing a single article
class ItemCell: UITableViewCell{
    @IBOutlet weak var newsItem: UILabel!
}


// Yet to implement this view
class NewsWebView: WKWebView {
@IBOutlet weak var newsWebView: WKWebView!
}

