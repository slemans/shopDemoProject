//
//  ProfileViewController.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import SnapKit
import UIKit

class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModel!

    // MARK: - Private

    // MARK: UI

    private let photoView = UIView()
    private let imageProfile = UIImageView()
    private let titleLabel = UILabel()
        .decorated(with: .text(Constants.titleLabel))
        .decorated(with: .font(.sf(.caption7())))
        .decorated(with: .alignment(.center))
        .decorated(with: .textColor(.gray2))
    private let nameLabel = UILabel()
        .decorated(with: .text(Constants.nameLabel))
        .decorated(with: .font(.sf(.wrongData([.bold]))))
        .decorated(with: .alignment(.center))
        .decorated(with: .textColor(.black1))
    private let uploadButton = UIButton()
        .decorated(with: .title(Constants.uploadButton))
        .decorated(with: .backgroundColor(.blue1))
        .decorated(with: .titleColor(.white))
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .cornerRadius(LayoutConstants.corner15))
    private let tradeView = CustomView(ofType: .arrow, title: Constants.tradeView)
    private let paymantView = CustomView(ofType: .arrow, title: Constants.paymantView)
    private let balanceView = CustomView(ofType: .summ, title: Constants.balanceView)
    private let tradeHistoryView = CustomView(ofType: .arrow, title: Constants.tradeHistoryView)
    private let restoreView = CustomView(ofType: .restore, title: Constants.restoreView)
    private let helpView = CustomView(ofType: .help, title: Constants.helpView)
    private let logOutView = CustomView(ofType: .logOut, title: Constants.logOutView)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupPhotoView()
        setupUIElement()
        setupLayout()
        setupActionElements()
    }

}

// MARK: - Private functions

private extension ProfileViewController {

    func setupView() {
        let titlePageProfile = UILabel()
            .decorated(with: .text(Constants.titlePage))
            .decorated(with: .font(.sf(.subheadline([.bold]))))

        navigationItem.titleView = titlePageProfile
        view.backgroundColor = .mainColor
    }

    func setupLayout() {
        [photoView, nameLabel, uploadButton, tradeView, paymantView, balanceView, tradeHistoryView, restoreView, helpView, logOutView].forEach { view.addSubview($0) }

        photoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset96poin5)
            make.height.width.equalTo(LayoutConstants.width77)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(photoView.snp.bottom).offset(LayoutConstants.offset19poin6)
            make.centerX.equalToSuperview()
        }
        uploadButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(LayoutConstants.offset37poin82)
            make.leading.trailing.equalToSuperview().inset(LayoutConstants.insert43)
            make.height.equalTo(LayoutConstants.height46)
        }
        tradeView.snp.makeConstraints { make in
            make.top.equalTo(uploadButton.snp.bottom).offset(LayoutConstants.offset14)
            make.leading.trailing.equalToSuperview().inset(LayoutConstants.insert32)
            make.height.equalTo(LayoutConstants.height40)
        }
        paymantView.snp.makeConstraints { make in
            make.top.equalTo(tradeView.snp.bottom).offset(LayoutConstants.offset25)
            make.leading.trailing.height.equalTo(tradeView)
        }
        balanceView.snp.makeConstraints { make in
            make.top.equalTo(paymantView.snp.bottom).offset(LayoutConstants.offset25)
            make.leading.trailing.height.equalTo(tradeView)
        }
        tradeHistoryView.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.bottom).offset(LayoutConstants.offset25)
            make.leading.trailing.height.equalTo(tradeView)
        }
        restoreView.snp.makeConstraints { make in
            make.top.equalTo(tradeHistoryView.snp.bottom).offset(LayoutConstants.offset25)
            make.leading.trailing.height.equalTo(tradeView)
        }
        helpView.snp.makeConstraints { make in
            make.top.equalTo(restoreView.snp.bottom).offset(LayoutConstants.offset25)
            make.leading.trailing.height.equalTo(tradeView)
        }
        logOutView.snp.makeConstraints { make in
            make.top.equalTo(helpView.snp.bottom).offset(LayoutConstants.offset25)
            make.leading.trailing.height.equalTo(tradeView)
        }

    }
    
    func setupPhotoView() {
        photoView.addSubview(imageProfile)
        imageProfile.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(LayoutConstants.height60)
            make.centerX.equalToSuperview()
        }
        photoView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageProfile.snp.bottom).offset(LayoutConstants.offset8poin5)
            make.centerX.equalToSuperview()
        }
    }

    func setupUIElement() {
        imageProfile.layer.cornerRadius = LayoutConstants.height60 / 2
        imageProfile.layer.borderWidth = LayoutConstants.borderWidth1
        imageProfile.layer.borderColor = UIColor.borderColor.cgColor

        let imageButton = Constants.arrowButton
        uploadButton.setImage(imageButton, for: .normal)
        uploadButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        uploadButton.semanticContentAttribute = .forceLeftToRight
    }

    func setupActionElements() {
        logOutView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(tapAction))
        )
        photoView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(tapPhoto))
        )
    }

    @objc
    func tapAction() {
        viewModel.tapLogOut()
    }

    @objc
    func tapPhoto() {
        viewModel.tapPhoto()
    }

}

// MARK: - Constants

private extension ProfileViewController {

    enum Constants {
        static let titlePage = "Profile"
        static let titleLabel = "Change photo"
        static let nameLabel = "Satria Adhi Pradana"
        static let uploadButton = "Upload item"
        static let tradeView = "Trade store"
        static let paymantView = "Payment method"
        static let balanceView = "Balance"
        static let tradeHistoryView = "Trade history"
        static let restoreView = "Restore Purchase"
        static let helpView = "Help"
        static let logOutView = "Log out"
        static let arrowButton = UIImage(named: "arrowButton")
    }

}
