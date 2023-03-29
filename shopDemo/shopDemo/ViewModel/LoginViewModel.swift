//
//  LoginViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol LogInPageViewModelDelegat {
    func goToPage1View(name: String, completion: @escaping (Bool) -> Void)
}

class LoginViewModel: LogInPageViewModelDelegat {
    
    weak var coordinatorDelegate: LogInViewModelCoordinatorDelegate?
    weak var serviseCoreData: ServiceWorkWithCoreDate?
    
    func goToPage1View(name: String, completion: @escaping (Bool) -> Void) {
        serviseCoreData?.newUserOrSaveNewUser(name) { [weak self] result in
            switch result {
            case false:
                self?.coordinatorDelegate?.goToPage1View()
            case true:
                completion(false)
            }
        }
    }
    
}
