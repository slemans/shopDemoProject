//
//  singInPageViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol SingInNavigation: AnyObject {

    func goToLogInPage()
    func goToPage1View()

}

class SingInPageViewModel {

    weak var navigation: SingInNavigation!

    init(nav: SingInNavigation) {
        self.navigation = nav
    }

    func goToLogIn() {
        navigation.goToLogInPage()
    }
    
    func goToPage1() {
        navigation.goToPage1View()
    }

}
