//
//  ModelLatest.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import Foundation

struct LatestProduct: Codable {
    let latest: [Latest]
}

// MARK: - Latest
struct Latest: Codable {

    private let category: String
    private let name: String
    private let price: Int
    private let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }

    func makeLatestModel() -> CollectionViewTwoPage1.Model {
        CollectionViewTwoPage1.Model(
            name: name,
            image: imageURL,
            category: makeCategory(),
            prise: price.shorted()
        )
    }
    
}

private extension Latest {

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
