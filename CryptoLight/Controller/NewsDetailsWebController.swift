//
//  NewsDetailsWebController.swift
//  CryptoLight
//
//  Created by Richard Price on 21/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import WebKit

protocol NewsDetailsWebControllerDelegate {
    func didSendUrl(article: NewsArticles)
}

class NewsDetailsWebController: UIViewController {
    
    var delegate: NewsDetailsWebControllerDelegate?
    var newsArticles: NewsArticles?
    lazy var articleUrl = ""
    
    var webView: WKWebView = {
        var view = WKWebView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isOpaque = false
        view.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
        view.scrollView.backgroundColor = UIColor.clear
        view.scrollView.bounces = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        getWebUrl()
        setupUI()
        transparentNavBar()
        view.layoutSubviews()
    }
    
    private func getWebUrl() {
        guard let url = URL(string: articleUrl) else {return}
        let myURLRequest:URLRequest = URLRequest(url: url)
        webView.load(myURLRequest)
    }
    
    private func setupUI() {
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        
        
    }
    
    fileprivate func transparentNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 38, green: 45, blue: 47)
    }
}
