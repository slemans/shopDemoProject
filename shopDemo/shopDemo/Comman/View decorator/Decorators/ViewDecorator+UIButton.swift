//
//  ViewDecorator+UIButton.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension ViewDecorator where View: UIButton {
    
    static func title(_ title: String, for state: UIControl.State = .normal) -> ViewDecorator<View> {
        ViewDecorator {
            $0.setTitle(title, for: state)
        }
    }
    
    static func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> ViewDecorator<View> {
        ViewDecorator {
            $0.setTitleColor(color, for: state)
        }
    }
    
    static func tintColor(_ color: UIColor) -> ViewDecorator<View> {
        ViewDecorator {
            $0.tintColor = color
        }
    }
    
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
    
    static func horizontalAlignment(_ alignment: NSTextAlignment) -> ViewDecorator<View> {
        ViewDecorator {
            $0.contentHorizontalAlignment = .left
        }
    }
    
    static func font(_ font: UIFont) -> ViewDecorator<View> {
        ViewDecorator {
            $0.titleLabel?.font = font
        }
    }
    
    static func image(_ image: UIImage?,
                      trailing: Bool = false,
                      spacing: CGFloat? = nil,
                      for state: UIControl.State = .normal) -> ViewDecorator<View> {
        ViewDecorator {
            $0.setImage(image, for: state)
            
            if trailing {
                let transform = CGAffineTransform(scaleX: -1, y: 1)
                
                $0.transform = transform
                $0.titleLabel?.transform = transform
                $0.imageView?.transform = transform
            }
            
            if let spacing = spacing {
                $0.contentEdgeInsets = .insets(right: spacing)
                $0.titleEdgeInsets = .insets(left: spacing, right: -spacing)
            }
        }
    }
    
}
