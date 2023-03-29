//
//  AuthorizationStatus.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import UIKit
import AVFoundation
import Photos

enum AuthorizationStatus: Int, RawRepresentable {
    
    case notDetermined = 0
    case restricted
    case denied
    case authorized
    case limited
    
    init(from avStatus: AVAuthorizationStatus) {
        self = .init(rawValue: avStatus.rawValue) ?? .restricted
    }
    
    init(from phStatus: PHAuthorizationStatus) {
        self = .init(rawValue: phStatus.rawValue) ?? .restricted
    }
    
}

struct AuthorizationStatusPhoto {
    let status: PHAuthorizationStatus
}

enum AccessType {
    case image(ImageSourceType)
}

enum ImageSourceType: Codable {
    
    case photoLibrary
    
    var uiKitSourceType: UIImagePickerController.SourceType {
        switch self {
        case .photoLibrary:
            return .photoLibrary
        }
    }
    
}
