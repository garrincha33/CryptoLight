//
//  UIViewController+Dismiss.swift
//  CryptoLight
//
//  Created by Richard Price on 17/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

extension UICollectionViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UICollectionViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
