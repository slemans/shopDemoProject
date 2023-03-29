//
//  HidePasswordButton.swift
//  shopDemo
//
//  Created by Павел on 17.03.23.
//

import SnapKit
import UIKit

final class HidePasswordButton: UIButton {

    // MARK: - Public

    // MARK: Variables

    var isPasswordVisible = false {
        didSet {
            setPasswordVisible(isPasswordVisible)
        }
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Private functions

private extension HidePasswordButton {

    func setupButton() {
        setPasswordVisible(false)
    }

    func setPasswordVisible(_ isVisible: Bool) {
        let image = isPasswordVisible
            ? UIImage(named: "eye.pdf")
        : UIImage(named: "eyeOff.pdf")

        decorate(with: .image(image, spacing: 15))
    }

}
