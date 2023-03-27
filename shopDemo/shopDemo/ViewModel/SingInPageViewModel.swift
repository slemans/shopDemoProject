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
    private let serviseCoreData: ServiceWorkWithCoreDate

    init(nav: SingInNavigation) {
        self.navigation = nav
        self.serviseCoreData = ServiceWorkWithCoreDate.shared
    }

    func goToLogIn() {
        navigation.goToLogInPage()
    }
    
    func checkTextfield(_ firstName: String, _ email: String, _ lastName: String, completion: @escaping ((Bool, Bool, Bool)) -> Void) {
        if !isValidEmail(email) {
            completion((true, false, false))
        } else if firstName.isEmpty {
            completion((false, true, false))
        } else {
            let user = UserMode(firstName: firstName, lastName: lastName, email: email)
            saveUser(user: user) { result in
                if !result {
                    completion((false, false, true))
                }
            }
        } 
    }

}


private extension SingInPageViewModel {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func saveUser(user: UserMode, completion: @escaping (Bool) -> Void) {
        serviseCoreData.newUserOrSaveNewUser(user.firstName) { [weak self] result in
            switch result {
            case true:
                self?.goToPage1(user)
            case false:
                completion(false)
            }
        }
    }
    
    func goToPage1(_ user: UserMode) {
        serviseCoreData.saveNewUserInCoreDate(user)
        navigation.goToPage1View()
    }
    
}
