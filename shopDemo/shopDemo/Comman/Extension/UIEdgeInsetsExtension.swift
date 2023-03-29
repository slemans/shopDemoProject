//
//  UIEdgeInsetsExtension.swift
//  shopDemo
//
//  Created by Павел on 17.03.23.
//

import UIKit

extension UIEdgeInsets {

    static func insets(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }

}
