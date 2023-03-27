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
    private let serviseCoreData: ServiceWorkWithCoreDate

    init(nav: LogInNavigation) {
        self.navigation = nav
        self.serviseCoreData = ServiceWorkWithCoreDate.shared
    }
    
    func goToPage1View(name: String, completion: @escaping (Bool) -> Void) {
        serviseCoreData.newUserOrSaveNewUser(name) { [weak self] result in
            switch result {
            case false:
                self?.goToPage1()
            case true:
                completion(false)
            }
        }
    }
    
}

private extension LoginViewModel {
    
    func goToPage1() {
        navigation.goToPage1View()
    }
    
}
