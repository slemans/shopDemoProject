//
//  ApplicationCoordinator.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

final class ApplicationCoordinator {

    // MARK: - Public

    // MARK: Variables
    
    static let shared = ApplicationCoordinator()
    
    var window = UIWindow()
    let navigationController = UINavigationController()
    weak var tabBarController: UITabBarController?
    private(set) lazy var tabChildren: [UINavigationController] = [
        page1ViewController(),
        makeDefaultNavigationController(nameImage: .head, sizeItem: 6.5),
        makeDefaultNavigationController(nameImage: .card),
        makeDefaultNavigationController(nameImage: .mesage),
        profileViewViewController()
    ]
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)

    // MARK: - Initializer

    private init() {}

    // MARK: - Public functions

    func start() {
        goToSingInPage()
//        goToPage1View()
     
    }

}

// MARK: - LogInNavigation, SingInNavigation, Page1Navigation, ProfileNavigation

extension ApplicationCoordinator: LogInNavigation, SingInNavigation, Page1Navigation, ProfileNavigation, Page2Navigation {
    
    func goToPage2() {
        let page2ViewController = storyboard.instantiateViewController(withIdentifier: "Page2View") as! Page2ViewController
        let page2ViewModel = Page2ViewModel.init(nav: self)
        page2ViewController.viewModel = page2ViewModel
        openController(screen: page2ViewController)
    }
    
    func goToProfilePage() {
        self.tabBarController?.selectedIndex = 4
    }
    
    func goToLogInPage() {
        let logInViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let loginViewModel = LoginViewModel.init(nav: self)
        logInViewController.viewModel = loginViewModel
        
        openController(screen: logInViewController)
    }

    func goToSingInPage() {
        let singInPageViewController = storyboard.instantiateViewController(withIdentifier: "SingInPage") as! SingInPageViewController
        let singInPageViewModel = SingInPageViewModel.init(nav: self)
        singInPageViewController.viewModel = singInPageViewModel
        
        openController(screen: singInPageViewController)
    }
    
    func goToPage1View() {
        self.tabBarController = makeTabBarController()
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

}

private extension ApplicationCoordinator {
    
    func openController(screen: UIViewController) {
        navigationController.setViewControllers([screen], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func makeTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        
        tabBarController.tabBar.tintColor = .tinColorTab
        tabBarController.tabBar.layer.cornerRadius = 30
        tabBarController.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let size = CGSize(width: 40, height: 40)
        let dotImage = UIImage().createSelectionIndicator(color: .backgraundItemTabBar, size: size, lineHeight: 35)

        tabBarController.tabBar.selectionIndicatorImage = dotImage
        
        tabBarController.viewControllers = tabChildren
        return tabBarController
    }
    
    func page1ViewController() -> UINavigationController {
        let page1ViewController = storyboard.instantiateViewController(withIdentifier: "Page1View") as! Page1ViewController
        let page1ViewModel = Page1ViewModel.init(nav: self)
        page1ViewController.viewModel = page1ViewModel
        
        page1ViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: NameViewController.main.rawValue),
            selectedImage: nil
        )
        
        page1ViewController.tabBarItem.imageInsets = makeUIEdgeInsets(size: 6)
        
        let page1NavigationController = UINavigationController(rootViewController: page1ViewController)
        
        return page1NavigationController
    }
    
    func profileViewViewController() -> UINavigationController {
        let profileViewViewController = storyboard.instantiateViewController(withIdentifier: "ProfileView") as! ProfileViewController
        let profilePageViewModel = ProfileViewModel.init(nav: self)
        profileViewViewController.viewModel = profilePageViewModel
        
        profileViewViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: NameViewController.profile.rawValue),
            selectedImage: nil
        )
        
        profileViewViewController.tabBarItem.imageInsets = makeUIEdgeInsets(size: 5)
        
        let navigationController = UINavigationController(rootViewController: profileViewViewController)
        
        return navigationController
    }
    
}

private extension ApplicationCoordinator {
    
    func makeUIEdgeInsets(size: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: size, left: 0, bottom: -size, right: 0)
    }
    
    func makeDefaultNavigationController(nameImage: NameViewController, sizeItem: CGFloat = 6) -> UINavigationController{
        let viewController = UIViewController()
        viewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: nameImage.rawValue),
            selectedImage: nil
        )
        viewController.tabBarItem.isEnabled = false
        viewController.tabBarItem.imageInsets = makeUIEdgeInsets(size: sizeItem)
        
        return UINavigationController(rootViewController: viewController)
    }
    
}

// MARK: - Entities

private extension ApplicationCoordinator {
    
    enum NameViewController: String {
        case head = "heard.pdf"
        case card = "card.pdf"
        case mesage = "mesage.pdf"
        case profile = "profilee.pdf"
        case main = "page1.pdf"
    }
    
}
