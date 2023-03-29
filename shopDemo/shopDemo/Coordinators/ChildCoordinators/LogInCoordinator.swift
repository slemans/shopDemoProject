//
//  LogInCoordinator.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import UIKit

protocol LogInCoordinatorDelegate: AnyObject {
    
    func goToPage1View()
    
}

protocol LogInViewModelCoordinatorDelegate: AnyObject {
    
    func goToPage1View()
    
}

class LogInCoordinator: Coordinator {
    
    // MARK: - Properties
    weak var delegate: LogInCoordinatorDelegate?
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let logInVc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        let viewModel = LoginViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.serviseCoreData = ServiceWorkWithCoreDate.shared
        logInVc.viewModel = viewModel
        window.rootViewController = logInVc
    }
    
}

extension LogInCoordinator: LogInViewModelCoordinatorDelegate {
    
    func goToPage1View() {
        delegate?.goToPage1View()
    }
    
}
