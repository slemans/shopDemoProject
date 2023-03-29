//
//  Page2ViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol Page2ViewModelDelegat {}

class Page2ViewModel: Page2ViewModelDelegat {
   
    weak var coordinatorDelegate: Page2ViewModelCoordinatorDelegate?
    
}

extension Page2ViewModel {
    
    struct Model {
        var name: String
        var prise: String
        var image: String
        
        init(){
            self.name = .emptyLine
            self.prise = .emptyLine
            self.image = .emptyLine
        }
    }
    
}
