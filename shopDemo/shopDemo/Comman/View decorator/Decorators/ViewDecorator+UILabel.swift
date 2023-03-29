//
//  ViewDecorator+UILabel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension ViewDecorator where View: UILabel {
    
    static func alignment(_ alignment: NSTextAlignment) -> ViewDecorator<View> {
        ViewDecorator {
            $0.textAlignment = alignment
        }
    }
    
    static func linesLimit(_ limit: Int) -> ViewDecorator<View> {
        ViewDecorator {
            $0.numberOfLines = limit
        }
    }
    
    static var multiline: ViewDecorator<View> {
        ViewDecorator {
            $0.decorated(with: .linesLimit(0))
        }
    }
    
    static func text(_ text: String) -> ViewDecorator<View> {
        ViewDecorator {
            $0.text = text
        }
    }
    
    static func tag(_ tag: Int) -> ViewDecorator<View> {
        ViewDecorator {
            $0.tag = tag
        }
    }
    
    static func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> ViewDecorator<View> {
        ViewDecorator {
            $0.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }

    static func attributedText(_ text: NSAttributedString) -> ViewDecorator<View> {
        ViewDecorator {
            $0.attributedText = text
        }
    }
    
    static func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> ViewDecorator<View> {
        ViewDecorator {
            $0.lineBreakMode = lineBreakMode
        }
    }
    
    static func font(_ font: UIFont, adjustsFontSizeToFitWidth: Bool = false) -> ViewDecorator<View> {
        ViewDecorator {
            $0.font = font
            $0.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        }
    }
    
    static func textColor(_ color: UIColor) -> ViewDecorator<View> {
        ViewDecorator {
            $0.textColor = color
        }
    }
    
    static func sizeToFit() -> ViewDecorator<View> {
        ViewDecorator {
            $0.sizeToFit()
        }
    }

}
