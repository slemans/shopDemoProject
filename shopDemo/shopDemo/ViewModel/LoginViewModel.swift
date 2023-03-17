//
//  LoginViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol LogInNavigation: AnyObject {

    func goToPage1View()

}

class LoginViewModel {
    
    weak var navigation: LogInNavigation!

    init(nav: LogInNavigation) {
        self.navigation = nav
    }
    
    func goToPage1View(name: String, password: String) {
        navigation.goToPage1View()
    }
    
}
