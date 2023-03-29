//
//  CollectionViewTwoCellPage1.swift
//  shopDemo
//
//  Created by Павел on 20.03.23.
//

import UIKit

final class CollectionViewTwoCellPage1: UICollectionViewCell {

    // MARK: - UI

    private let title = UILabel()
        .decorated(with: .textColor(.gray6))
        .decorated(with: .font(.sf(.caption9([.semibold]))))
        .decorated(with: .alignment(.left))
        .decorated(with: .textColor(.white))
        .decorated(with: .lineBreakMode(.byWordWrapping))
        .decorated(with: .multiline)
    private let viewImage = UIView()
    private let imageView = UIImageView()
    private let prise = UILabel()
        .decorated(with: .alignment(.left))
        .decorated(with: .textColor(.white))
        .decorated(with: .font(.sf(.caption8([.semibold]))))
    private let categoryView = UIView()
    private let categoryLabel = UILabel()
        .decorated(with: .textColor(.black))
        .decorated(with: .font(.sf(.caption4poin5([.bold]))))
        .decorated(with: .alignment(.center))
    private let plusButton = UIButton()
        .decorated(with: .image(UIImage(systemName: "plus")))
        .decorated(with: .tintColor(.blue3))
        .decorated(with: .backgroundColor(.gray9))
        .decorated(with: .cornerRadius(10))


    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addGradient()
        setupUI()
        setupLayout()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func setupCell(with model: CollectionViewTwoPage1.Model) {
        title.decorated(with: .text(model.name))
        prise.decorated(with: .text(model.prise))
        categoryLabel.decorated(with: .text(model.category.rawValue))
        
        if model.image == "ps5" {
            imageView.decorated(with: .image(UIImage(named: "ps5")))
        } else {
            getImageForUrl(url: model.image)
        }
    }

}

private extension CollectionViewTwoCellPage1 {

    func getImageForUrl(url: String) {
        guard let urlImg = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlImg) { data, _, _ in
            if let data = data,
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.decorated(with: .image(image))
                }
            }
        }.resume()
    }

    func setupUI() {
        categoryView.backgroundColor = .gray9
        categoryView.layer.cornerRadius = 6
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
    }

    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        imageView.layer.addSublayer(gradient)
    }

    func setupLayout() {
        [viewImage, title, categoryView, prise, plusButton].forEach { addSubview($0) }

        viewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        viewImage.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.top.leading.equalToSuperview()
        }
        prise.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(7.37)
            make.leading.equalToSuperview().inset(7)
        }
        categoryView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(91)
            make.leading.equalToSuperview().inset(7)
            make.width.equalTo(35)
            make.height.equalTo(12)
        }
        categoryView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(categoryView.snp.bottom).offset(6.31)
            make.leading.equalToSuperview().inset(7.5)
            make.trailing.equalToSuperview().inset(49)
        }
        plusButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(5)
            make.width.height.equalTo(20)
        }

    }

}
