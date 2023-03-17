//
//  Page1ViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol Page1Navigation: AnyObject {

}

class Page1ViewModel {
    
    weak var navigation: Page1Navigation!

    init(nav: Page1Navigation) {
        self.navigation = nav
    }
    
}
