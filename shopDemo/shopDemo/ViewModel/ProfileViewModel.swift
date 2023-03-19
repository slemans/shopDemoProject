//
//  ProfileViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol ProfileNavigation: AnyObject {
    
}

class ProfileViewModel {
    
    weak var navigation: Page1Navigation!

    init(nav: Page1Navigation) {
        self.navigation = nav
    }
    
    func tapLogOut() {
        print("tapLogOut")
    }
    func tapPhoto() {
        print("tapPhoto")
    }
    
}
