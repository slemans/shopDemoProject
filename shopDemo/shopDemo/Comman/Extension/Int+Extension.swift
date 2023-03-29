//
//  Int+Extension.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation

extension Int {
    
    func shorted() -> String {
        if self >= 1000 && self < 100000 {
            return "$ \(self / 1000),000"
        } else {
            return "$ \(String(self))"
        }
    }
    
}
