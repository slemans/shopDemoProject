//
//  ProfileViewModel.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import Foundation

protocol ProfileViewModelDelegat {

    func tapLogOut()
    func tapPhoto()

}

class ProfileViewModel: ProfileViewModelDelegat {

    weak var coordinatorDelegate: ProfileViewModelCoordinatorDelegate?
    var deviceAccessService: DeviceAccessService?

    func tapLogOut() {
        coordinatorDelegate?.goToSingInPage()
    }
    
    func tapPhoto() {
        deviceAccessService?.checkAccess(for: .image(.photoLibrary)) { [weak self] status in
            switch status {
            case .success(let status):
                self?.processAuthorizationStatus(status)
            case .failure:
                break
            }
        }
    }

}

private extension ProfileViewModel {

    func processAuthorizationStatus(_ status: AuthorizationStatus) {
        switch status {
        case .notDetermined:
            deviceAccessService?.checkAccessPhoto { [weak self] success in
                guard let self else { return }
                
                self.didConfirmChangingImage(type: .photo(success.status))
            }
        case .authorized, .limited:
            break
            // TODO: Открыть ImagePicker
        default:
            break
        }
    }
    
    func didConfirmChangingImage(type: DeviceAccessService.TypeRequest) {
        switch type {
        case let .photo(response):
            if response == .authorized {
                confirmChangingImage()
            }
        }
    }
    
    func confirmChangingImage() {
        DispatchQueue.main.async {
            // TODO: Открыть ImagePicker
        }
    }
    
}
