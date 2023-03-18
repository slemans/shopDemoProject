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

final class ApplicationCoordinator {

    // MARK: - Public

    // MARK: Variables
    
    static let shared = ApplicationCoordinator()
    
    var window = UIWindow()
    let navigationController = UINavigationController.init()
    var children: [UIViewController] = []

    // MARK: - Initializer

    private init() {
        setAllUIViewController()
    }

    // MARK: - Public functions

    func start() {
        goToSingInPage()
    }

}

// MARK: - LogInNavigation

extension ApplicationCoordinator: LogInNavigation, SingInNavigation, Page1Navigation {
    
    func goToPage1View() {
        navigationController.setViewControllers([children[2]], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func goToLogInPage() {
        navigationController.setViewControllers([children[1]], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func goToSingInPage() {
        navigationController.setViewControllers([children[2]], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func setAllUIViewController() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        
        let singInPageViewController = storyboard.instantiateViewController(withIdentifier: "SingInPage") as! SingInPageViewController
        let singInPageViewModel = SingInPageViewModel.init(nav: self)
        singInPageViewController.viewModel = singInPageViewModel
        children.append(singInPageViewController)
        
        let logInViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let loginViewModel = LoginViewModel.init(nav: self)
        logInViewController.viewModel = loginViewModel
        children.append(logInViewController)
        
        let page1ViewController = storyboard.instantiateViewController(withIdentifier: "Page1View") as! Page1ViewController
        let page1ViewModel = Page1ViewModel.init(nav: self)
        page1ViewController.viewModel = page1ViewModel
        children.append(page1ViewController)
    }

}
