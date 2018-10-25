//
//  NewsController.swift
//  CryptoLight
//
//  Created by Richard Price on 09/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class NewsController: BaseCollectionViewController<CustomNewsControllerCell, NewsArticles>, UICollectionViewDelegateFlowLayout, NewsDetailsWebControllerDelegate {
    
    func didSendUrl(article: NewsArticles) {
        let newsDetailsController = NewsDetailsWebController()
        newsDetailsController.delegate = self
        guard let urlToSend = article.url else {return}
        newsDetailsController.newsArticles = article
        newsDetailsController.articleUrl = urlToSend
        navigationController?.pushViewController(newsDetailsController, animated: true)
    }
    
    
    let errorLable: UILabel = {
        let lable = UILabel()
        lable.text = "unable to list news artcles please try again later"
        lable.textColor = .red
        lable.backgroundColor = UIColor(displayP3Red: 193/255, green: 19/155, blue: 57/255, alpha: 0.5)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 16
        lable.clipsToBounds = true
        lable.layer.shadowRadius = 10
        lable.layer.shadowOpacity = 0.5
        lable.font = UIFont(name: "Poppins-Regular", size: 15)
        lable.textColor = UIColor.rgb(red: 200, green: 201, blue: 202)
        lable.numberOfLines = -1
        return lable
    }()
    
    lazy var refresh: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return rc
    }()
    
    @objc func handleRefresh() {
        collectionView.reloadData()
        let refreshDelay = DispatchTime.now() + .milliseconds(1200)
        DispatchQueue.main.asyncAfter(deadline: refreshDelay) {
            self.refresh.endRefreshing()
        }
    }

    override func viewDidLoad() {
        items = [NewsArticles]()
        fetchArticles()
        collectionView.refreshControl = refresh
        collectionView?.backgroundColor = UIColor.rgb(red: 38, green: 45, blue: 47)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = items[indexPath.row]
        didSendUrl(article: article)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 3 * 8) / 2 + 155
        return CGSize(width: width, height: width - 70)
    }
    
    fileprivate func fetchArticles() {
        APIService.shared.fetchArticlesFromApi { (articles, err) in
            if let err = err {
                print("unable to list news artcles", err)
                self.showError()
                return
            }
            guard let artcilesFromApi = articles else {return}
            self.items = artcilesFromApi
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func showError() {
        collectionView.addSubview(errorLable)
        errorLable.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 100, paddingLeft: 35, paddingBottom: 0, paddingRight: 30, width: 300, height: 100)
    }
}
