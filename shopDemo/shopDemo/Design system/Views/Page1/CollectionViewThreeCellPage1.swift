//
//  CollectionViewThreeCellPage1.swift
//  shopDemo
//
//  Created by Павел on 20.03.23.
//

import UIKit

final class CollectionViewThreeCellPage1: UICollectionViewCell {

    // MARK: - UI

    private let icon = UIButton()
        .decorated(with: .image(UIImage(systemName: "person")))
        .decorated(with: .tintColor(.gray4))
        .decorated(with: .backgroundColor(.gray9))
        .decorated(with: .cornerRadius(12))
    private let categoryView = UIView()
    private let title = UILabel()
        .decorated(with: .textColor(.gray6))
        .decorated(with: .font(.sf(.caption12([.semibold]))))
        .decorated(with: .alignment(.left))
        .decorated(with: .textColor(.white))
        .decorated(with: .lineBreakMode(.byWordWrapping))
        .decorated(with: .multiline)
    private let viewImage = UIView()
    private let imageView = UIImageView()
    private let prise = UILabel()
        .decorated(with: .alignment(.left))
        .decorated(with: .textColor(.white))
        .decorated(with: .font(.sf(.caption9([.semibold]))))
    private let categoryLabel = UILabel()
        .decorated(with: .textColor(.black))
        .decorated(with: .font(.sf(.caption7([.bold]))))
        .decorated(with: .alignment(.center))
    private let plusButton = UIButton()
        .decorated(with: .image(UIImage(systemName: "plus")))
        .decorated(with: .tintColor(.blue3))
        .decorated(with: .backgroundColor(.gray9))
        .decorated(with: .cornerRadius(16.5))
    private let likeButton = UIButton()
        .decorated(with: .image(UIImage(systemName: "heart")))
        .decorated(with: .tintColor(.blue3))
        .decorated(with: .backgroundColor(.gray9))
        .decorated(with: .cornerRadius(14))

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func setupCell(with model: CollectionViewThreePage1.Model) {
        title.decorated(with: .text(model.name))
        prise.decorated(with: .text(model.prise))
        categoryLabel.decorated(with: .text(model.category.rawValue))
        imageView.decorated(with: .image(model.image))
    }

}

private extension CollectionViewThreeCellPage1 {

    func setupUI() {
        viewImage.layer.cornerRadius = 10
        categoryView.backgroundColor = .white
        categoryView.layer.cornerRadius = 6
        categoryView.layer.opacity = 0.85
        viewImage.backgroundColor = .gray7
        viewImage.layer.opacity = 0.5
        icon.layer.borderWidth = 1
        icon.layer.borderColor = UIColor.gray4.cgColor
    }

    func setupLayout() {
        [viewImage, icon, title, categoryView, prise, plusButton, likeButton].forEach { addSubview($0) }

        icon.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(7.5)
            make.width.height.equalTo(24)
        }
        viewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        viewImage.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        prise.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11.66)
            make.leading.equalToSuperview().inset(10.53)
        }
        categoryView.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(89.5)
            make.leading.equalToSuperview().inset(7)
            make.width.equalTo(59)
            make.height.equalTo(18)
        }
        categoryView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(categoryView.snp.bottom).offset(11.38)
            make.leading.equalToSuperview().inset(9.51)
            make.trailing.equalToSuperview().inset(82.29)
        }
        plusButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(7)
            make.trailing.equalToSuperview().inset(4)
            make.width.height.equalTo(35)
        }
        likeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalTo(plusButton.snp.leading).offset(-5)
            make.width.height.equalTo(28)
        }
    }

}
