//
//  FlashSaleModel.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation

struct FlashSaleProduct: Codable {
    let flashSale: [FlashSale]

    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct FlashSale: Codable {
    private let category: String
    private let name: String
    private let price: Double
    private let discount: Int
    private let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
    
    func makeFlashModel() -> CollectionViewThreePage1.Model {
        CollectionViewThreePage1.Model(
            name: name,
            image: imageURL,
            category: makeCategory(),
            prise: "$ \(price)",
            discont: "\(discount)% off"
        )
    }
    
}

private extension FlashSale {

    func makeCategory() -> CollectionViewTwoPage1.Category {
        switch category {
        case CollectionViewTwoPage1.Category.game.rawValue:
            return .game
        case CollectionViewTwoPage1.Category.phone.rawValue:
            return .phone
        case CollectionViewTwoPage1.Category.card.rawValue:
            return .card
        default:
            return .kids
        }
    }

}
