//
//  BaseCell.swift
//  CryptoLight
//
//  Created by Richard Price on 15/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class BaseCell<U>: UICollectionViewCell {
    
    var item: U! //used for didSet in custom cells
    
        let titleContainer: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    

    
}
