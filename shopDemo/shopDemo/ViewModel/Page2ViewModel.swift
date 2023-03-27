//
//  Page2ViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol Page2Navigation: AnyObject {
    
}

class Page2ViewModel {
    
    weak var navigation: Page2Navigation!

    init(nav: Page2Navigation) {
        self.navigation = nav
    }
    
    
}

extension Page2ViewModel {
    
    struct Model {
        var name: String
        var prise: String
        var image: String
        
        init(){
            self.name = .emptyLine
            self.prise = .emptyLine
            self.image = .emptyLine
        }
    }
    
}
