//
//  ApplicationCoordinator.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

protocol Coordinator {

    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()

}

class ApplicationCoordinator: Coordinator {

    // MARK: - Public

    // MARK: Variables

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)

    // MARK: - Initializer

    init(navController: UINavigationController) {
        self.navigationController = navController
    }

    // MARK: - Public functions

    func start() {
        goToSingInPage()
    }

}

// MARK: - LogInNavigation

extension ApplicationCoordinator: LogInNavigation, SingInNavigation {
    
    func goToPage1View() {
       
    }
    
    func goToLogInPage() {
        let logInViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let loginViewModel = LoginViewModel.init(nav: self)
        logInViewController.viewModel = loginViewModel
        navigationController.pushViewController(logInViewController, animated: true)
    }

    func goToSingInPage() {
        let singInPageViewController = storyboard.instantiateViewController(withIdentifier: "SingInPage") as! SingInPageViewController
        let singInPageViewModel = SingInPageViewModel.init(nav: self)
        singInPageViewController.viewModel = singInPageViewModel
        navigationController.pushViewController(singInPageViewController, animated: true)
    }

}