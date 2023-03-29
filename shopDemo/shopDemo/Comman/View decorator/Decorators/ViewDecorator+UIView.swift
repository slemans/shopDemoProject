//
//  ViewDecorator+UIView.swift
//  shopDemo
//
//  Created by Павел on 29.03.23.
//

import UIKit

extension ViewDecorator where View: UIView {
    
    static func backgroundColor(_ color: UIColor) -> ViewDecorator<View> {
        ViewDecorator {
            $0.backgroundColor = color
        }
    }
    static func cornerRadius(_ radius: CGFloat) -> ViewDecorator<View> {
        ViewDecorator {
            $0.layer.cornerRadius = radius
        }
    }
    static func tintColor(_ color: UIColor) -> ViewDecorator<View> {
        ViewDecorator {
            $0.tintColor = color
        }
    }
    
}
