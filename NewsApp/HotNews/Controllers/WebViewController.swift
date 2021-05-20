//
//  WebViewController.swift
//  HotNews
//
//  Created by Balaji Sadagopan
//  Copyright © 2021 Balaji Sadagopan. All rights reserved.
//

import Foundation
import SafariServices

class NewsWebViewController: UIViewController, SFSafariViewControllerDelegate {
    var newsWebURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = SFSafariViewController(url: newsWebURL)
        vc.delegate = self
        present(vc, animated: true)
    }
}
