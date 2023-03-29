//
//  Page2Coordinator.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import UIKit

protocol Page2CoordinatorDelegate: AnyObject {
    func backMain()
}

protocol Page2ViewModelCoordinatorDelegate: AnyObject {}

class Page2Coordinator: Coordinator {
    
    // MARK: - Properties
    
    weak var delegate: Page2CoordinatorDelegate?
    
    let window: UIWindow
    private var viewController: UIViewController = Page2ViewController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let page2Vc = storyboard.instantiateViewController(withIdentifier: "Page2View") as! Page2ViewController

        let viewModel = Page2ViewModel()
        viewModel.coordinatorDelegate = self
        page2Vc.viewModel = viewModel
        viewController = page2Vc
    }
    
    func makeScreen() -> UIViewController {
        viewController
    }
    
}

extension Page2Coordinator: Page2ViewModelCoordinatorDelegate {}
