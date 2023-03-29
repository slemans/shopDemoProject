//
//  Page1ViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

protocol Page1ViewModelDelegat {
    func goToProfile()
    func openPage2(product: Page2ViewModel.Model)
}

class Page1ViewModel: Page1ViewModelDelegat {
    
    weak var coordinatorDelegate: Page1ViewModelCoordinatorDelegate?
    var networkServise: ShopThingsService?
    
    private var arrayColectionLatest: [CollectionViewTwoPage1.Model] = []
    private var arrayColectionFlash: [CollectionViewThreePage1.Model] = []
    private var arrayColectionCategory: [CollectionViewPage1.Model] = []
    private var arrayColectionBrand: [CollectionViewTwoPage1.Model] = []
    
    var arrayFlash: [CollectionViewThreePage1.Model] {
        arrayColectionFlash
    }
    var arrayLatest: [CollectionViewTwoPage1.Model] {
        arrayColectionLatest
    }
    var arrayCategory: [CollectionViewPage1.Model] {
        arrayColectionCategory
    }
    var arrayBrand: [CollectionViewTwoPage1.Model] {
        arrayColectionBrand
    }
    
    func getAllProduct(completion: @escaping () -> Void) {
        let group = DispatchGroup()
        
        group.enter()
        getLatestShop {
            group.leave()
        }
        group.enter()
        getFlashSaleShop {
            group.leave()
        }
        group.enter()
        getBrands {
            group.leave()
        }
        group.enter()
        getCategory {
            group.leave()
        }
        group.notify(queue: .main) {
            completion()
        }
    }
    
    func goToProfile() {
        coordinatorDelegate?.goToProfile()
    }
    
    func sendTextTextField(text: String) {
        // TODO: Do after realise
    }
    
    func openPage2(product: Page2ViewModel.Model) {
        coordinatorDelegate?.goToPage2()
    }
    
}

private extension Page1ViewModel{
    
    func getLatestShop(completion: @escaping () -> Void) {
        networkServise?.getLatest { result in
            switch result {
            case .success(let latest):
                self.arrayColectionLatest = latest.latest.map { $0.makeLatestModel() }
                completion()
            case .failure:
                break
            }
        }
    }
    
    func getCategory(completion: @escaping () -> Void) {
        arrayColectionCategory = [
            CollectionViewPage1.Model(
                name: "Phones",
                image: UIImage(named: "categoryNew1")
            ),
            CollectionViewPage1.Model(
                name: "Headphones",
                image: UIImage(named: "categoryNew2")
            ),
            CollectionViewPage1.Model(
                name: "Games",
                image: UIImage(named: "categoryNew3")
            ),
            CollectionViewPage1.Model(
                name: "Cars",
                image: UIImage(named: "categoryNew4")
            ),
            CollectionViewPage1.Model(
                name: "Furniture",
                image: UIImage(named: "categoryNew5")
            ),
            CollectionViewPage1.Model(
                name: "kids",
                image: UIImage(named: "categoryNew6")
            )
        ]
        completion()
    }
    
    func getFlashSaleShop(completion: @escaping () -> Void) {
        networkServise?.getFlashSale { result in
            switch result {
            case .success(let flashSale):
                self.arrayColectionFlash = flashSale.flashSale.map {$0.makeFlashModel() }
                completion()
            case .failure:
                break
            }
        }
    }
    
    func getBrands(completion: @escaping () -> Void) {
        arrayColectionBrand = (1...10).map { _ in
            return CollectionViewTwoPage1.Model(
                name: "Samsung S10",
                image: "ps5",
                category: .game,
                prise: "$ 180.0000"
            )
        }
        completion()
    }
    
}
