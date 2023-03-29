//
//  Page1Coordinator.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import UIKit

protocol Page1CoordinatorDelegate: AnyObject {
    
    func goToPage1View()
    func goTopageSingIn()
    
}

protocol Page1ViewModelCoordinatorDelegate: AnyObject {
    
    func goToProfile()
    func goToPage2()
    
}

protocol ProfileViewModelCoordinatorDelegate: AnyObject {
    
    func goToSingInPage()
    
}

class Page1Coordinator: Coordinator {
    
    // MARK: - Properties
    
    weak var delegate: Page1CoordinatorDelegate?
    
    let window: UIWindow
    
    weak var tabBarController: UITabBarController?
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private(set) lazy var tabChildren: [UINavigationController] = [
        makePage1Vc(),
        makeDefaultNavigationController(nameImage: .head, sizeItem: 6.5),
        makeDefaultNavigationController(nameImage: .card),
        makeDefaultNavigationController(nameImage: .mesage),
        profileViewViewController()
    ]
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        tabBarController = makeTabBarController()
        window.rootViewController = tabBarController
    }
}

private extension Page1Coordinator {
    
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
    
    func makeUIEdgeInsets(size: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: size, left: 0, bottom: -size, right: 0)
    }
    
}

// MARK: Create Screes

private extension Page1Coordinator {
    
    func makePage1Vc() -> UINavigationController {
        let page1Vc = storyboard.instantiateViewController(withIdentifier: "Page1View") as! Page1ViewController

        let viewModel = Page1ViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.networkServise = ShopThingsService.shared
        page1Vc.viewModel = viewModel
        
        page1Vc.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: NameViewController.main.rawValue),
            selectedImage: nil
        )
        page1Vc.tabBarItem.imageInsets = makeUIEdgeInsets(size: 6)
        
        return UINavigationController(rootViewController: page1Vc)
    }
    
    func profileViewViewController() -> UINavigationController {
        let profileVc = storyboard.instantiateViewController(withIdentifier: "ProfileView") as! ProfileViewController
        let viewModel = ProfileViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.deviceAccessService = DeviceAccessService.shared
        profileVc.viewModel = viewModel
        
        profileVc.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: NameViewController.profile.rawValue),
            selectedImage: nil
        )
        profileVc.tabBarItem.imageInsets = makeUIEdgeInsets(size: 5)
        
        return UINavigationController(rootViewController: profileVc)
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

private extension Page1Coordinator {
    
    enum NameViewController: String {
        case head = "heard.pdf"
        case card = "card.pdf"
        case mesage = "mesage.pdf"
        case profile = "profilee.pdf"
        case main = "page1.pdf"
    }
    
}

extension Page1Coordinator: Page1ViewModelCoordinatorDelegate {
    
    func goToProfile() {
        tabBarController?.selectedIndex = 4
    }
    
    func goToPage2() {
        let page2Coordinator = Page2Coordinator(window: window)
        let screen = page2Coordinator.makeScreen()
        tabChildren[0].pushViewController(screen, animated: true)
    }
    
}

extension Page1Coordinator: ProfileViewModelCoordinatorDelegate {
    
    func goToSingInPage() {
        delegate?.goTopageSingIn()
    }
    
}

//extension Page1Coordinator: Page2ViewModelCoordinatorDelegate {
//    
//    func back() {
//        
//    }
//    
//}
