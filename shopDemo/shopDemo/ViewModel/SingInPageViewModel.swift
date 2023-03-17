//
//  singInPageViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol SingInNavigation: AnyObject {

    func goToLogInPage()

}

class SingInPageViewModel {

    weak var navigation: SingInNavigation!

    init(nav: SingInNavigation) {
        self.navigation = nav
    }

    func goToRegister() {
        navigation.goToLogInPage()
    }

}
