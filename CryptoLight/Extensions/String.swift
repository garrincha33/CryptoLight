//
//  String.swift
//  CryptoLight
//
//  Created by Richard Price on 21/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation

extension String {
    //Truncates the string to the specified length number of characters
    func trunc(length: Int) -> String {
        return (self.count > length) ? String(self.prefix(length)) : self
    }
}
