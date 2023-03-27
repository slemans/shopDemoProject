//
//  ShopThingsTarget.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import UIKit
import Moya

enum ShopThingsTarget {

    case getFlashSale
    case getLatest

}

extension ShopThingsTarget: TargetType {
    
    var baseURL: URL {
        switch self {
        default:
            return URL(stringLiteral: "https://run.mocky.io/v3/")
        }
    }
    
    var path: String {
        switch self {
        case .getLatest:
            return "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case .getFlashSale:
            return "a9ceeb6e-416d-4352-bde6-2203416576ac"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return .none
        }
    }
    
    
}
