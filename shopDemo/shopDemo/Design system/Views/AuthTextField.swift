//
//  AuthTextField.swift
//  shopDemo
//
//  Created by Павел on 17.03.23.
//

import SnapKit
import UIKit

final class AuthTextField: UITextField {

    // MARK: - Private

    // MARK: Variables

    private var textFieldType: AuthFieldType?

    // MARK: UI

    private let hidePasswordButton = HidePasswordButton(frame: Constants.hideButtonFrame)

    // MARK: - Initialization

    init(ofType type: AuthFieldType, placeholder: String = .emptyLine) {
        super.init(frame: .zero)

        self.textFieldType = type
        decorate(with: .placeholder(placeholder))
        decorate(with: .autocapitalizationType(.none))
        decorated(with: .tintColor(.gray2))
        decorated(with: .textColor(.gray2))
        decorated(with: .alignment(.center))
        decorated(with: .font(.sf(.footnote())))
        decorated(with: .backgroundColor(.gray1))
        decorated(with: .rounded(radius: 15))

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Private functions

private extension AuthTextField {

    func setupLayout() {
        setupKeyboardType()
        setupRightView()
   
    }

    func setupKeyboardType() {
        textFieldType == .code ? decorate(with: .keyboard(type: .numberPad)) : decorate(with: .keyboard(type: .emailAddress))
    }
    func setupRightView() {
        switch textFieldType {
        case .password:
            decorate(with: .rightViewMode(.always))
            decorate(with: .isSecureTextEntry(true))
            decorate(with: .rightView(hidePasswordButton))
            let paddingView = UIView(frame: CGRectMake(0, 0, 32, self.frame.height))
            decorated(with: .leftView(paddingView))
            decorated(with: .leftViewMode(.always))
            hidePasswordButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 0)
            setupHidePasswordButton()
        default:
            break
        }
    }

    func setupHidePasswordButton() {
        hidePasswordButton.addAction(for: .touchUpInside) { [weak self] _ in
            guard let self = self else { return }

            self.hidePasswordButton.isPasswordVisible.toggle()
            self.isSecureTextEntry.toggle()
        }
    }

}



// MARK: - Entities

extension AuthTextField {

    enum AuthFieldType {
        case email
        case password
        case code
    }

}

// MARK: - Constants

extension AuthTextField {

    enum Constants {
        static let hideButtonFrame = CGRect(x: 0, y: 0, width: 15, height: 15)
    }

}
