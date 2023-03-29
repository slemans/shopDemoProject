//
//  singInPageViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol SingInPageViewModelDelegat {
    typealias DateUser = (firstName: String, lastName: String, email: String)
    typealias respondTextField = (Bool, Bool, Bool)
    
    func goToLogInPage()
    func checkTextField(date: DateUser, completion: @escaping (respondTextField) -> Void)
}

class SingInPageViewModel: SingInPageViewModelDelegat {
    
    weak var coordinatorDelegate: SingInViewModelCoordinatorDelegate?
    weak var serviseCoreData: ServiceWorkWithCoreDate?

    func checkTextField(date: DateUser, completion: @escaping (respondTextField) -> Void) {
        if !isValidEmail(date.email) {
            completion((true, false, false))
        } else if date.firstName.isEmpty {
            completion((false, true, false))
        } else {
            let user = UserMode(firstName: date.firstName, lastName: date.lastName, email: date.email)
            saveUser(user: user) { result in
                if !result {
                    completion((false, false, true))
                }
            }
        }
    }
    
    func goToLogInPage() {
        coordinatorDelegate?.goToLogInPage()
    }

}


private extension SingInPageViewModel {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func saveUser(user: UserMode, completion: @escaping (Bool) -> Void) {
        serviseCoreData?.newUserOrSaveNewUser(user.firstName) { [weak self] result in
            switch result {
            case true:
                self?.goToPage1(user)
            case false:
                completion(false)
            }
        }
    }
    
    func goToPage1(_ user: UserMode) {
        serviseCoreData?.saveNewUserInCoreDate(user)
        coordinatorDelegate?.goToPage1View()
    }
    
}
