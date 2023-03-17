//
//  ViewDecorator+UITextView.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension ViewDecorator where View: UITextField {
    
    static func alignment(_ alignment: NSTextAlignment) -> ViewDecorator<View> {
        ViewDecorator {
            $0.textAlignment = alignment
        }
    }
    
    static func backgroundColor(_ color: UIColor) -> ViewDecorator<View> {
        ViewDecorator {
            $0.backgroundColor = color
        }
    }
    
    static func font(_ font: UIFont) -> ViewDecorator<View> {
        ViewDecorator {
            $0.font = font
        }
    }
    
    static func rounded(radius: CGFloat) -> ViewDecorator<View> {
        ViewDecorator {
            $0.layer.cornerRadius = radius
        }
    }

    static func textColor(_ color: UIColor) -> ViewDecorator<View> {
        ViewDecorator {
            $0.textColor = color
        }
    }
    
    static func tintColor(_ color: UIColor) -> ViewDecorator<View> {
        ViewDecorator {
            $0.tintColor = color
        }
    }

    static func keyboard(type: UIKeyboardType) -> ViewDecorator<View> {
        ViewDecorator {
            $0.keyboardType = type
        }
    }

    static func placeholder(_ placeholder: String) -> ViewDecorator<View> {
        ViewDecorator {
            $0.placeholder = placeholder
        }
    }
    
    static func enabled(_ isEnabled: Bool) -> ViewDecorator<View> {
        ViewDecorator {
            $0.isEnabled = isEnabled
        }
    }
    
    static func autocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> ViewDecorator<View> {
        ViewDecorator {
            $0.autocorrectionType = autocorrectionType
        }
    }
    
    static func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> ViewDecorator<View> {
        ViewDecorator {
            $0.autocapitalizationType = autocapitalizationType
        }
    }
    
    static func rightView(_ rightView: UIView) -> ViewDecorator<View> {
        ViewDecorator {
            $0.rightView = rightView
        }
    }
    
    static func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> ViewDecorator<View> {
       ViewDecorator {
           $0.rightViewMode = rightViewMode
       }
   }
    
    static func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> ViewDecorator<View> {
       ViewDecorator {
           $0.leftViewMode = leftViewMode
       }
   }
    
    static func leftView(_ leftView: UIView) -> ViewDecorator<View> {
        ViewDecorator {
            $0.leftView = leftView
        }
    }
    
    static func isSecureTextEntry(_ isSecureTextEntry: Bool) -> ViewDecorator<View> {
       ViewDecorator {
           $0.isSecureTextEntry = isSecureTextEntry
       }
    }
    
    static func text(_ text: String) -> ViewDecorator<View> {
        ViewDecorator {
            $0.text = text
        }
    }
    
}
