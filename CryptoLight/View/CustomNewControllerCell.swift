//
//  CustomNewControllerCell.swift
//  CryptoLight
//
//  Created by Richard Price on 09/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import SDWebImage

class CustomNewsControllerCell: UICollectionViewCell {
    
    let usernameLable: UILabel = {
        let lable = UILabel()
        lable.text = "Username"
        lable.backgroundColor = UIColor(displayP3Red: 193/255, green: 19/155, blue: 57/255, alpha: 0.5)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 16
        lable.clipsToBounds = true
        lable.layer.shadowRadius = 10
        lable.layer.shadowOpacity = 0.5
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        lable.textColor = UIColor.rgb(red: 200, green: 201, blue: 202)
        lable.numberOfLines = -1
        return lable
    }()
    
    fileprivate let titleContainer: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    var newsArticles: NewsArticles! {
        didSet {
            
            usernameLable.text = newsArticles.title
            for images in newsArticles?.urlToImage ?? [""] {
                guard let url = URL(string: images) else {return}
                titleContainer.sd_setImage(with: url, completed: nil)
             
            }
        }
    }

    fileprivate func setupNewsFeed() {
        addSubview(titleContainer)
        titleContainer.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        
        addSubview(usernameLable)
        usernameLable.anchor(top: titleContainer.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNewsFeed()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
   
}
