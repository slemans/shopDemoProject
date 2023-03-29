//
//  DeviceAccessService.swift
//  shopDemo
//
//  Created by Павел on 28.03.23.
//

import AVFoundation
import Photos
import UIKit

protocol DeviceAccessServiceProtocol {
    func checkAccess(for accessType: AccessType, completion: (Result<AuthorizationStatus, Error>) -> Void)
    func checkAccessPhoto(completion: @escaping (AuthorizationStatusPhoto) -> Void)
}

final class DeviceAccessService {
    
    static let shared = DeviceAccessService()
    
    private init() { }
    
}

extension DeviceAccessService: DeviceAccessServiceProtocol {
    
    func checkAccess(for accessType: AccessType, completion: (Result<AuthorizationStatus, Error>) -> Void) {
        completion(checkAccess(for: accessType))
    }
    func checkAccessPhoto(completion: @escaping (AuthorizationStatusPhoto) -> Void) {
        requestAccessPhoto { completion($0) }
    }
    
}

private extension DeviceAccessService {
    
    func requestAccessPhoto(completion: @escaping (_ success: AuthorizationStatusPhoto) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            completion(AuthorizationStatusPhoto(status: status))
        }
    }
    
    func checkAccess(for type: AccessType) -> Result<AuthorizationStatus, Error> {
        switch type {
        case .image(let source):
            return ImageAccessService(imageSourceType: source).checkAccess()
        }
    }
}

extension DeviceAccessService {
    
    final class ImageAccessService: ConcreteDeviceAccessServiceProtocol {
        
        private let imageSourceType: ImageSourceType
        
        init(imageSourceType: ImageSourceType) {
            self.imageSourceType = imageSourceType
        }
        
        func checkAccess() -> Result<AuthorizationStatus, Error> {
            switch imageSourceType {
            case .photoLibrary:
                return .success(statusForPhotoLibrary())
            }
        }
        
        private func statusForPhotoLibrary() -> AuthorizationStatus {
            AuthorizationStatus(from: PHPhotoLibrary.authorizationStatus())
        }
    }
    
}

// MARK: - Public Entities

extension DeviceAccessService {

    enum TypeRequest {
        case photo(PHAuthorizationStatus)
    }

}

protocol ConcreteDeviceAccessServiceProtocol {

    func checkAccess() -> Result<AuthorizationStatus, Error>

}

