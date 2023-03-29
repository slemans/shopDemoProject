//
//  LoginViewController.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Public

    // MARK: External dependencies

    var viewModel: LoginViewModel!

    // MARK: - Private

    // MARK: UI

    private let titleLabel = UILabel()
        .decorated(with: .text(Constants.titleLabel))
        .decorated(with: .font(.sf(.h1([.semibold]))))
        .decorated(with: .alignment(.center))
    private let firstNameTextField = AuthTextField(ofType: .email, placeholder: LableTextField.firstName.rawValue)
    private let errorNameLabel = UILabel()
        .decorated(with: .font(.sf(.caption10())))
        .decorated(with: .alignment(.center))
        .decorated(with: .textColor(.red))
        .decorated(with: .text(Constants.errorNameLabel))
    private let passwordNameTextField = AuthTextField(ofType: .password, placeholder: LableTextField.passwordName.rawValue)
    private let loginButton = UIButton()
        .decorated(with: .title(Constants.titleButton))
        .decorated(with: .backgroundColor(.blue1))
        .decorated(with: .titleColor(.white))
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .cornerRadius(LayoutConstants.corner15))

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupButtons()
        setupView()
    }

}

// MARK: - Private functions

private extension LoginViewController {

    func setupView() {
        view.backgroundColor = .mainColor
        errorNameLabel.layer.opacity = LayoutConstants.opacity0
    }

    func setupLayout() {
        [titleLabel, firstNameTextField, errorNameLabel, passwordNameTextField, loginButton].forEach { view.addSubview($0) }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset158poin71)
            make.centerX.equalToSuperview()
        }
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(LayoutConstants.offset77poin7)
            make.height.equalTo(LayoutConstants.height29)
            make.leading.trailing.equalToSuperview().inset(LayoutConstants.insert44)
        }
        errorNameLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(LayoutConstants.offset1)
            make.leading.trailing.equalTo(firstNameTextField)
        }
        passwordNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(LayoutConstants.offset35)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordNameTextField.snp.bottom).offset(LayoutConstants.offset99)
            make.leading.trailing.equalTo(passwordNameTextField)
            make.height.equalTo(LayoutConstants.height46)
        }
    }

    func setupButtons() {
        loginButton.addAction(for: .touchUpInside) { [weak self] _ in
            guard let self = self,
                let name = self.firstNameTextField.text
                else { return }

            self.viewModel.goToPage1View(name: name) { result in
                if !result {
                    self.errorNameLabel.layer.opacity = LayoutConstants.opacity1
                }
            }
        }
    }

}

// MARK: - Constants

private extension LoginViewController {

    enum Constants {
        static let titleLabel = "Welcome back"
        static let titleButton = "Login"
        static let errorNameLabel = "That name there is not!! You shout write other name"
    }
    enum LableTextField: String {
        case firstName = "First name"
        case passwordName = "Password"
    }

}
