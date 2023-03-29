//
//  AppCoordinator.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Properties
    var window: UIWindow
    var coordinators = [String: Coordinator]()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showSingInPage()
    }
}

private extension AppCoordinator {

    func showSingInPage() {
        let singInCoordinator = SingInCoordinator(window: window)
        coordinators["SingIn"] = singInCoordinator
        singInCoordinator.delegate = self
        singInCoordinator.start()
    }

}

extension AppCoordinator: SingInCoordinatorDelegate {
    
    func goToLogInPage() {
        let logInCoordinator = LogInCoordinator(window: window)
        coordinators["LogIn"] = logInCoordinator
        logInCoordinator.delegate = self
        logInCoordinator.start()
    }
    
}

extension AppCoordinator: LogInCoordinatorDelegate {
    
    func goToPage1View() {
        let page1Coordinator = Page1Coordinator(window: window)
        coordinators["Page1"] = page1Coordinator
        page1Coordinator.delegate = self
        page1Coordinator.start()
    }
    
}

extension AppCoordinator: Page1CoordinatorDelegate {
    
    func goTopageSingIn() {
        coordinators["SingIn"]?.start()
    }
    
}
