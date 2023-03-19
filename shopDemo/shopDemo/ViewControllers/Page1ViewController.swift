//
//  Page1ViewController.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import SnapKit
import UIKit

class Page1ViewController: UIViewController {
    
    var viewModel: Page1ViewModel!
    
    let titleViewCustom = UIView()
    private let profileImageButton = UIButton()
        .decorated(with: .image(UIImage(named: "profile.pdf")))

    override func loadView() {
        super.loadView()

        setupTitleView()
        setupView()
        setupButtonAction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageButton.imageView?.layer.cornerRadius = profileImageButton.frame.width / 2
    }
    
}

private extension Page1ViewController {

    func setupView() {
        view.backgroundColor = .mainColor
        let buttonLeft = UIButton()
            .decorated(with: .image(UIImage(named: "clip.pdf")))
        buttonLeft.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonLeft.widthAnchor.constraint(equalToConstant: 22).isActive = true
        buttonLeft.contentHorizontalAlignment = .left
        
        profileImageButton.imageView?.contentMode = .scaleAspectFill
        
        navigationItem.titleView = titleViewCustom
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImageButton)
    }
    
    func setupButtonAction() {
        profileImageButton.addAction(for: .touchUpInside) { [weak self] _ in
            self?.viewModel.goToProfile()
        }
    }
    
    func setupTitleView() {
        let fullTitle = UIView()
        let leftPartTitle = UILabel()
            .decorated(with: .text("Trade by"))
            .decorated(with: .font(.sf(.h3([.bold]))))
        let rightPartTitle = UILabel()
            .decorated(with: .text("bata"))
            .decorated(with: .font(.sf(.h3([.bold]))))
            .decorated(with: .textColor(.blue2))
        fullTitle.addSubview(leftPartTitle)
        fullTitle.addSubview(rightPartTitle)
        leftPartTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-5)
            make.leading.equalToSuperview().inset(-5)
        }
        rightPartTitle.snp.makeConstraints { make in
            make.top.equalTo(leftPartTitle.snp.top)
            make.leading.equalTo(leftPartTitle.snp.trailing).offset(5)
        }
        titleViewCustom.addSubview(fullTitle)
        fullTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(132)
            make.height.equalTo(19)
        }
    }
    
}

// MARK: - Constants

private extension Page1ViewController {
    
    enum Constants {
       
    }
    
}
