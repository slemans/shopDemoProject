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
    private let firstNameTextField = AuthTextField(ofType: .email, placeholder: LableTextField.firstName.rawValue)
    private let errorNameLabel = UILabel()
        .decorated(with: .font(.sf(.caption10())))
        .decorated(with: .alignment(.center))
        .decorated(with: .textColor(.red))
    private let lastNameTextField = AuthTextField(ofType: .email, placeholder: LableTextField.lastName.rawValue)
    private let emailNameTextField = AuthTextField(ofType: .email, placeholder: LableTextField.email.rawValue)
    private let errorLabel = UILabel()
        .decorated(with: .text(Constants.errorLabel))
        .decorated(with: .font(.sf(.caption10())))
        .decorated(with: .alignment(.center))
        .decorated(with: .textColor(.red))
    private let singInButton = UIButton()
        .decorated(with: .title(Constants.titleLabel))
        .decorated(with: .backgroundColor(.blue1))
        .decorated(with: .titleColor(.white))
        .decorated(with: .font(.sf(.body([.semibold]))))
        .decorated(with: .cornerRadius(LayoutConstants.corner15))
    private let alreadyLabel = UILabel()
        .decorated(with: .textColor(.gray3))
        .decorated(with: .font(.sf(.caption12())))
        .decorated(with: .text(Constants.alreadyTitle))
    private let logInButton = UIButton()
        .decorated(with: .font(.sf(.caption12())))
        .decorated(with: .title(Constants.logInTitle))
        .decorated(with: .titleColor(.blue2))
    private let googleImageView = UIImageView()
        .decorated(with: .image(Constants.google))
    private let googleLable = UILabel()
        .decorated(with: .text(Constants.googleTitle))
        .decorated(with: .font(.sf(.footnote())))
    private let appleImageView = UIImageView()
        .decorated(with: .image(Constants.apple))
    private let appleLable = UILabel()
        .decorated(with: .text(Constants.appleTitle))
        .decorated(with: .font(.sf(.footnote())))

    // MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupButtons()
        setupTextField()
        setupView()
    }

}

// MARK: - Private functions

private extension SingInPageViewController {
    
    func setupView() {
        view.decorated(with: .backgroundColor(.mainColor))
        errorLabel.layer.opacity = LayoutConstants.opacity0
        errorNameLabel.layer.opacity = LayoutConstants.opacity0
    }

    func setupLayout() {
        [titleLabel, firstNameTextField, errorNameLabel, lastNameTextField, emailNameTextField, errorLabel, singInButton, alreadyLabel, logInButton, googleImageView, googleLable, appleImageView, appleLable].forEach { view.addSubview($0) }

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
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(LayoutConstants.offset35)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        emailNameTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(LayoutConstants.offset35)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(emailNameTextField.snp.bottom).offset(LayoutConstants.offset1)
            make.leading.trailing.height.equalTo(firstNameTextField)
        }
        singInButton.snp.makeConstraints { make in
            make.top.equalTo(emailNameTextField.snp.bottom).offset(LayoutConstants.offset35)
            make.leading.trailing.equalTo(firstNameTextField)
            make.height.equalTo(LayoutConstants.height46)
        }
        alreadyLabel.snp.makeConstraints { make in
            make.top.equalTo(singInButton.snp.bottom).offset(LayoutConstants.offset17poin58)
            make.leading.equalTo(firstNameTextField)
        }
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(singInButton.snp.bottom).offset(LayoutConstants.offset11point58)
            make.leading.equalTo(alreadyLabel.snp.trailing).offset(LayoutConstants.offset8poin7)
        }
        googleImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(LayoutConstants.offset99)
            make.top.equalTo(singInButton.snp.bottom).offset(LayoutConstants.offset74)
            make.height.equalTo(LayoutConstants.height24poin22)
            make.width.equalTo(LayoutConstants.width23poin83)
        }
        googleLable.snp.makeConstraints { make in
            make.leading.equalTo(googleImageView.snp.trailing).offset(LayoutConstants.offset11point67)
            make.top.equalTo(singInButton.snp.bottom).offset(LayoutConstants.offset77)
        }
        appleImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(LayoutConstants.offset99)
            make.top.equalTo(googleImageView.snp.bottom).offset(LayoutConstants.offset38)
            make.height.equalTo(LayoutConstants.height21poin87)
            make.width.equalTo(LayoutConstants.width18poin38)
        }
        appleLable.snp.makeConstraints { make in
            make.leading.equalTo(appleImageView.snp.trailing).offset(LayoutConstants.offset14poin11)
            make.top.equalTo(googleImageView.snp.bottom).offset(LayoutConstants.offset40poin98)
        }

    }
    
    func setupButtons() {
        singInButton.addAction(for: .touchUpInside) { [weak self] _ in
            guard let self = self,
                  let name = self.firstNameTextField.text,
                  let lastName = self.lastNameTextField.text,
                  let email = self.emailNameTextField.text
            else { return }
            
            self.viewModel.checkTextField(date: (name, lastName, email)) { result in
                switch result {
                case (true, false, false):
                    self.checkView(labe: self.errorLabel)
                case (false, true, false):
                    self.checkView(labe: self.errorNameLabel)
                    self.errorNameLabel.text = Constants.errorEmptyNameLabel
                default:
                    self.checkView(labe: self.errorNameLabel)
                    self.errorNameLabel.text = Constants.errorNameLabel
                }
            }
        }
        
        logInButton.addAction(for: .touchUpInside) { [weak self] _ in
            self?.viewModel?.goToLogInPage()
        }
    }
    
    func checkView(labe: UILabel) {
        [errorNameLabel, errorLabel].forEach { label in
            if label == labe {
                label.layer.opacity = LayoutConstants.opacity1
            } else {
                label.layer.opacity = LayoutConstants.opacity0
            }
        }
    }
    
    
    func setupTextField() {
        [firstNameTextField, lastNameTextField, emailNameTextField].forEach { textField in
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                for: .editingDidBegin)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        textField.text = .emptyLine
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
        static let errorLabel = "You need to check email"
        static let errorNameLabel = "That name there is!! You can tap Log in"
        static let errorEmptyNameLabel = "Need write your name"
        static let google = UIImage(named: "google.png")
        static let apple = UIImage(named: "apple2.png")
    }
    enum LableTextField: String {
        case firstName = "First name"
        case lastName = "Last name"
        case email = "Email"
    }

}
