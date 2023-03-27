//
//  Page1ViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol Page1Navigation: AnyObject {

    func goToProfilePage()
    func goToPage2()
    
}

class Page1ViewModel {
    
    weak var navigation: Page1Navigation!
    private let networkServise: ShopThingsService
    private var arrayColectionLatest: [CollectionViewTwoPage1.Model] = []
    private var arrayColectionFlash: [CollectionViewThreePage1.Model] = []
    
    var getArrayColectionFlash: [CollectionViewThreePage1.Model] {
        arrayColectionFlash
    }
    var getArrayColectionLatest: [CollectionViewTwoPage1.Model] {
        arrayColectionLatest
    }

    init(nav: Page1Navigation) {
        self.navigation = nav
        self.networkServise = ShopThingsService.shared
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
        group.notify(queue: .main) {
            completion()
        }
    }
    
    func goToProfile() {
        navigation.goToProfilePage()
    }
    
    func sendTextTextField(text: String) {
        // TODO: Do after realise
    }
    
    func openPage2(product: Page2ViewModel.Model) {
        // send model
        navigation.goToPage2()
    }
    
}

private extension Page1ViewModel{
    
    func getLatestShop(completion: @escaping () -> Void) {
        networkServise.getLatest { result in
            switch result {
            case .success(let latest):
                self.arrayColectionLatest = latest.latest.map { $0.makeLatestModel() }
                completion()
            case .failure:
                break
            }
        }
    }
    
    func getFlashSaleShop(completion: @escaping () -> Void) {
        networkServise.getFlashSale { result in
            switch result {
            case .success(let flashSale):
                self.arrayColectionFlash = flashSale.flashSale.map {$0.makeFlashModel() }
                completion()
            case .failure:
                break
            }
        }
    }
    
}
