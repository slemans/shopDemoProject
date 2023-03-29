//
//  ShopThingsService.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation
import Moya


protocol ShopThingsServiceProtocol {
    
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    func getLatest(completion: @escaping CompletionHandler<LatestProduct>)
    func getFlashSale(completion: @escaping CompletionHandler<FlashSaleProduct>)
    
}

struct ShopThingsService {
    
    let provider = MoyaProvider<ShopThingsTarget>()
    
    static let shared = ShopThingsService()
    private init() { }
    
}

// MARK: - Function RegistrationService

extension ShopThingsService: ShopThingsServiceProtocol {
    
    func getLatest(completion: @escaping CompletionHandler<LatestProduct>) {
        provider.request(.getLatest) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try response.map(LatestProduct.self)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFlashSale(completion: @escaping CompletionHandler<FlashSaleProduct>) {
        provider.request(.getFlashSale) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try response.map(FlashSaleProduct.self)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
