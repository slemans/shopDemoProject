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
    
    private let profileImageButton = UIButton()
        .decorated(with: .image(UIImage(named: "profile.pdf")))

    override func loadView() {
        super.loadView()

        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageButton.imageView?.layer.cornerRadius = profileImageButton.frame.width / 2
    }
    
}

private extension Page1ViewController {
    
    func setupView() {
        let buttonLeft = UIButton()
            .decorated(with: .image(UIImage(named: "clip.pdf")))
        buttonLeft.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonLeft.widthAnchor.constraint(equalToConstant: 22).isActive = true
        buttonLeft.contentHorizontalAlignment = .left
        
        
        profileImageButton.addAction(for: .touchUpInside) { _ in
            print("tap")
        }
        
        profileImageButton.imageView?.contentMode = .scaleAspectFill
        let leftPartTitle = UILabel()
            .decorated(with: .text("Trade by"))
            .decorated(with: .font(.sf(.h3([.bold]))))
        let rightPartTitle = UILabel()
            .decorated(with: .text("bata"))
            .decorated(with: .font(.sf(.h3([.bold]))))
            .decorated(with: .textColor(.blue2))
        let mainView = UIView()
        let fullTitle = UIView()
        fullTitle.addSubview(leftPartTitle)
        fullTitle.addSubview(rightPartTitle)
        leftPartTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()//.offset(8)
            make.leading.equalToSuperview()
        }
        rightPartTitle.snp.makeConstraints { make in
            make.top.equalTo(leftPartTitle.snp.top)
            make.leading.equalTo(leftPartTitle.snp.trailing).offset(5)
        }
        mainView.addSubview(fullTitle)
        fullTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(132)
        }
        
        navigationItem.titleView = mainView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImageButton)
    }
    
}

// MARK: - Constants

private extension Page1ViewController {
    
    enum Constants {
        static let titlePage = "Trade by data"
    }
    
}
