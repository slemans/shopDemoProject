//
//  UIFont+Fonts.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

extension UIFont {
    
    static let sf: (DesignSystemFont) -> UIFont = {
        makeFont(using: $0)
    }
    
}

// MARK: - Font styles

extension UIFont {
    
    enum DesignSystemFont {
        case wrongData(Inscriptions? = nil)
        case h1(Inscriptions? = nil)
        case h2(Inscriptions? = nil)
        case h3(Inscriptions? = nil)
        case h4(Inscriptions? = nil)
        case h5(Inscriptions? = nil)
        case body(Inscriptions? = nil)
        case footnote(Inscriptions? = nil)
        case caption10(Inscriptions? = nil)
        case caption6poin5(Inscriptions? = nil)
        case caption4poin5(Inscriptions? = nil)
        case caption7(Inscriptions? = nil)
        case caption8(Inscriptions? = nil)
        case caption9(Inscriptions? = nil)
        case caption11(Inscriptions? = nil)
        case caption12(Inscriptions? = nil)
        case callout(Inscriptions? = nil)
        case subheadline(Inscriptions? = nil)
        
        var fontType: Type {
            let size: CGFloat
            let inscriptions: Inscriptions?
            
            switch self {
            case .wrongData(let lettering):
                size = 17
                inscriptions = lettering
            case .h1(let lettering):
                size = 30
                inscriptions = lettering
            case .h2(let lettering):
                size = 28
                inscriptions = lettering
            case .h3(let lettering):
                size = 22
                inscriptions = lettering
            case .h4(let lettering):
                size = 20
                inscriptions = lettering
            case .h5(let lettering):
                size = 19
                inscriptions = lettering
            case .body(let lettering):
                size = 17
                inscriptions = lettering
            case .footnote(let lettering):
                size = 13
                inscriptions = lettering
            case .caption4poin5(let lettering):
                size = 4.5
                inscriptions = lettering
            case .caption10(let lettering):
                size = 10
                inscriptions = lettering
            case .caption7(let lettering):
                size = 7
                inscriptions = lettering
            case .caption6poin5(let lettering):
                size = 6.5
                inscriptions = lettering
            case .caption8(let lettering):
                size = 8
                inscriptions = lettering
            case .caption9(let lettering):
                size = 9
                inscriptions = lettering
            case .caption11(let lettering):
                size = 11
                inscriptions = lettering
            case .caption12(let lettering):
                size = 12
                inscriptions = lettering
            case .callout(let lettering):
                size = 16
                inscriptions = lettering
            case .subheadline(let lettering):
                size = 15
                inscriptions = lettering
            }
            
            return (size: size, weight: inscriptions?.weight ?? .regular)
        }
        
    }
    
}

// MARK: - Entities

extension UIFont {
    
    enum Inscription {
        case bold, semibold, italic
    }
    
    typealias Inscriptions = [Inscription]
    
    typealias `Type` = (size: CGFloat, weight: Weight)
    
}

// MARK: - Inscriptions

extension UIFont.Inscriptions {
    
    var weight: UIFont.Weight {
        if contains(.bold) {
            return .bold
        } else if contains(.semibold) {
            return .semibold
        } else {
            return .regular
        }
    }
    
}

// MARK: - Private functions

private extension UIFont {
    
    static func makeFont(using style: DesignSystemFont) -> UIFont {
        switch style {
        case .wrongData(let inscriptions),
             .h1(let inscriptions),
             .h2(let inscriptions),
             .h3(let inscriptions),
             .h4(let inscriptions),
             .h5(let inscriptions),
             .body(let inscriptions),
             .footnote(let inscriptions),
             .caption6poin5(let inscriptions),
             .caption4poin5(let inscriptions),
             .caption7(let inscriptions),
             .caption8(let inscriptions),
             .caption9(let inscriptions),
             .caption10(let inscriptions),
             .caption11(let inscriptions),
             .caption12(let inscriptions),
             .callout(let inscriptions),
             .subheadline(let inscriptions):
            
            let fontType = style.fontType
            
            var font: UIFont?
            switch style.fontType.weight {
            case .bold:
                font = UIFont(name: "Montserrat-Bold", size: fontType.size)
            case .semibold:
                font = UIFont(name: "Montserrat-SemiBold", size: fontType.size)
            default:
                font = UIFont(name: "Montserrat", size: fontType.size)
            }

            guard let font else { return .systemFont(ofSize: fontType.size, weight: fontType.weight)}
            
            return inscriptions?.contains(.italic) ?? false
            ? font.bold
                : font
        }
    }
    
}
