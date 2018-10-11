//
//  CustomNewControllerCell.swift
//  CryptoLight
//
//  Created by Richard Price on 09/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class CustomNewsControllerCell: UICollectionViewCell {
    
    let usernameLable: UILabel = {
        let lable = UILabel()
        lable.text = "Username"
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        lable.textColor = UIColor.rgb(red: 200, green: 201, blue: 202)
        return lable
        
    }()
    
    fileprivate let titleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 25
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupNewsFeed()

    }
    
    fileprivate func setupUI() {
      
    }
    
    fileprivate func setupNewsFeed() {
        addSubview(titleContainer)
        titleContainer.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        
        addSubview(usernameLable)
        usernameLable.anchor(top: titleContainer.topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 25, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
}
