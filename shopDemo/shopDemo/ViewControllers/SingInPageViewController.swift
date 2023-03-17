//
//  SingInPageViewController.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import SnapKit
import UIKit

class SingInPageViewController: UIViewController {
    
    // MARK: - Public
    
    // MARK: External dependencies

    var viewModel: SingInPageViewModel!
    
    // MARK: - Private

    // MARK: UI

    private let titleLabel = UILabel()
        .decorated(with: .text(Constants.titleLabel))
        .decorated(with: .font(.sf(.h1([.semibold]))))
        .decorated(with: .alignment(.center))
    private let firstNameTextField = makeTextFieldMy(.firstName)
    private let lastNameTextField = makeTextFieldMy(.lastName)
    private let emailNameTextField = makeTextFieldMy(.email)
    private let singInButton = UIButton()
        .decorated(with: .title(Constants.titleLabel))
        .decorated(with: .backgroundColor(.blue1))
        .decorated(with: .titleColor(.white))
        .decorated(with: .font(.sf(.body([.bold]))))
        .decorated(with: .cornerRadius(15))
    private let alreadyLabel = UILabel()
        .decorated(with: .textColor(.gray3))
        .decorated(with: .font(.sf(.caption12())))
        .decorated(with: .text(Constants.alreadyTitle))
    private let logInButton = UIButton()
        .decorated(with: .font(.sf(.caption12())))
        .decorated(with: .title(Constants.logInTitle))
        .decorated(with: .titleColor(.blue2))
    private let googleImageView = UIImageView()
        .decorated(with: .image(UIImage(named: "google.png")))
    private let googleLable = UILabel()
        .decorated(with: .text(Constants.googleTitle))
        .decorated(with: .font(.sf(.footnote())))
    private let appleImageView = UIImageView()
        .decorated(with: .image(UIImage(named: "apple2.png")))
    private let appleLable = UILabel()
        .decorated(with: .text(Constants.appleTitle))
        .decorated(with: .font(.sf(.footnote())))

    // MARK: - Override functions
    
    override func loadView() {
        super.loadView()

        setupLayout()
        setupButtons()
        setupTextField()
    }

}

// MARK: - Private functions

private extension SingInPageViewController {

    func setupLayout() {
        [titleLabel, firstNameTextField, lastNameTextField, emailNameTextField, singInButton, alreadyLabel, logInButton, googleImageView, googleLable, appleImageView, appleLable].forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(125.93)
            make.centerX.equalToSuperview()
        }
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(77.7)
            make.height.equalTo(29)
            make.leading.trailing.equalToSuperview().inset(44)
        }
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(35)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        emailNameTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(35)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        singInButton.snp.makeConstraints { make in
            make.top.equalTo(emailNameTextField.snp.bottom).offset(35)
            make.leading.trailing.equalTo(firstNameTextField)
            make.height.equalTo(46)
        }
        alreadyLabel.snp.makeConstraints { make in
            make.top.equalTo(singInButton.snp.bottom).offset(17.58)
            make.leading.equalTo(firstNameTextField)
        }
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(singInButton.snp.bottom).offset(11.58)
            make.leading.equalTo(alreadyLabel.snp.trailing).offset(8.7)
        }
        googleImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(99)
            make.top.equalTo(singInButton.snp.bottom).offset(74)
            make.height.equalTo(24.22)
            make.width.equalTo(23.83)
        }
        googleLable.snp.makeConstraints { make in
            make.leading.equalTo(googleImageView.snp.trailing).offset(11.66)
            make.top.equalTo(singInButton.snp.bottom).offset(77)
        }
        appleImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(99)
            make.top.equalTo(googleImageView.snp.bottom).offset(38)
            make.height.equalTo(21.87)
            make.width.equalTo(18.38)
        }
        appleLable.snp.makeConstraints { make in
            make.leading.equalTo(appleImageView.snp.trailing).offset(14.11)
            make.top.equalTo(googleImageView.snp.bottom).offset(40.98)
        }


    }

    static func makeTextFieldMy(_ type: LableTextField) -> UITextField {
        UITextField()
            .decorated(with: .placeholder(type.rawValue))
            .decorated(with: .tintColor(.gray2))
            .decorated(with: .textColor(.gray2))
            .decorated(with: .alignment(.center))
            .decorated(with: .font(.sf(.footnote())))
            .decorated(with: .backgroundColor(.gray1))
            .decorated(with: .rounded(radius: 15))
    }
    
    func setupButtons() {
        singInButton.addAction(for: .touchUpInside) { [weak self] _ in
            guard let self = self,
                let name = self.firstNameTextField.text,
                let lastName = self.lastNameTextField.text,
                  let email = self.emailNameTextField.text
                else { return }
            
            print(name)
            print(lastName)
            print(email)
        }
        logInButton.addAction(for: .touchUpInside) { [weak self] _ in
            self?.viewModel.goToRegister()
        }
    }
    
    func setupTextField() {
        firstNameTextField.text = LableTextField.firstName.rawValue
        lastNameTextField.text = LableTextField.lastName.rawValue
        emailNameTextField.text = LableTextField.email.rawValue
        [firstNameTextField, lastNameTextField, emailNameTextField].forEach { textField in
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                for: .editingDidBegin)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        textField.text = ""
    }

}

// MARK: - Constants

private extension SingInPageViewController {

    enum Constants {
        static let titleLabel = "Sign in"
        static let alreadyTitle = "Already have an account?"
        static let logInTitle = "Log in"
        static let googleTitle = "Sing in with Google"
        static let appleTitle = "Sing in with Apple"
    }
    enum LableTextField: String {
        case firstName = "First name"
        case lastName = "Last name"
        case email = "Email"
    }

}
