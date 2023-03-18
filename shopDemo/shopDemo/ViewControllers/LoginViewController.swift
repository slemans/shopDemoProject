//
//  LoginViewController.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: LoginViewModel!

    // MARK: - Private

    // MARK: UI

    private let titleLabel = UILabel()
        .decorated(with: .text(Constants.titleLabel))
        .decorated(with: .font(.sf(.h1([.semibold]))))
        .decorated(with: .alignment(.center))
    private let firstNameTextField = AuthTextField(ofType: .code, placeholder: LableTextField.firstName.rawValue)
    private let passwordNameTextField = AuthTextField(ofType: .password, placeholder: LableTextField.passwordName.rawValue)
    private let loginButton = UIButton()
        .decorated(with: .title(Constants.titleButton))
        .decorated(with: .backgroundColor(.blue1))
        .decorated(with: .titleColor(.white))
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .cornerRadius(15))

    override func loadView() {
        super.loadView()

        setupLayout()
        setupButtons()
        setupView()
    }

}

// MARK: - Private functions

private extension LoginViewController {
    
    func setupView() {

    }
    
    func setupLayout() {
        [titleLabel, firstNameTextField, passwordNameTextField, loginButton].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(158.71)
            make.centerX.equalToSuperview()
        }
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(77.7)
            make.height.equalTo(29)
            make.leading.trailing.equalToSuperview().inset(44)
        }
        passwordNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(35)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordNameTextField.snp.bottom).offset(99)
            make.leading.trailing.equalTo(passwordNameTextField)
            make.height.equalTo(46)
        }
    }
    
    func setupButtons() {
        loginButton.addAction(for: .touchUpInside) { [weak self] _ in
            guard let self = self,
                let name = self.firstNameTextField.text,
                let password = self.passwordNameTextField.text
                else { return }
            
            self.viewModel.goToPage1View(name: name, password: password)
        }
    }
    
}
// MARK: - Constants

    private extension LoginViewController {

        enum Constants {
            static let titleLabel = "Welcome back"
            static let titleButton = "Login"
        }
        enum LableTextField: String {
            case firstName = "First name"
            case passwordName = "Password"
        }

    }
