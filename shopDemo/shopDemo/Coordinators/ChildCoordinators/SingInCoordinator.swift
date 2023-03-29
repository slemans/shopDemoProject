//
//  SingInCoordinator.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import UIKit

protocol SingInCoordinatorDelegate: AnyObject {
    
    func goToLogInPage()
    func goToPage1View()
    
}

protocol SingInViewModelCoordinatorDelegate: AnyObject {
    
    func goToLogInPage()
    func goToPage1View()
    
}

class SingInCoordinator: Coordinator {

    // MARK: - Properties
    weak var delegate: SingInCoordinatorDelegate?
    
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let singInVc = storyboard.instantiateViewController(withIdentifier: "SingInPage") as! SingInPageViewController

        let viewModel = SingInPageViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.serviseCoreData = ServiceWorkWithCoreDate.shared
        singInVc.viewModel = viewModel
        window.rootViewController = singInVc
    }

}

extension SingInCoordinator: SingInViewModelCoordinatorDelegate {

    func goToLogInPage() {
        delegate?.goToLogInPage()
    }

    func goToPage1View() {
        delegate?.goToPage1View()
    }

}

