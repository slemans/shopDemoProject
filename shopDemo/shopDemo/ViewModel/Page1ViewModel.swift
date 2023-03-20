//
//  Page1ViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol Page1Navigation: AnyObject {

    func goToProfilePage()
    
}

class Page1ViewModel {
    
    weak var navigation: Page1Navigation!

    init(nav: Page1Navigation) {
        self.navigation = nav
    }
    
    func goToProfile() {
        navigation.goToProfilePage()
    }
    
    func sendTextTextField(text: String) {
        
    }
    
}
