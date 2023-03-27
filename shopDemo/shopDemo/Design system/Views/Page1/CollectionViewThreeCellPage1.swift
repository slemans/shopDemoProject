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
    private let saleView = UIView()
    private let saleLabel = UILabel()
        .decorated(with: .font(.sf(.caption8([.bold]))))
        .decorated(with: .textColor(.white))

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        addGradient()
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
        getImageForUrl(url: model.image)
        saleLabel.decorated(with: .text(model.discont))
    }

}

private extension CollectionViewThreeCellPage1 {

    func setupUI() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        categoryView.backgroundColor = .gray9
        categoryView.layer.cornerRadius = 6
        icon.layer.borderWidth = 1
        icon.layer.borderColor = UIColor.gray4.cgColor
        saleView.layer.cornerRadius = 9
        saleView.backgroundColor = .red1
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
    }
    
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 0).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        imageView.layer.addSublayer(gradient)
    }
    
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

    func setupLayout() {
        [viewImage, icon, title, categoryView, prise, plusButton, likeButton, saleView].forEach { addSubview($0) }

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
            make.width.height.top.leading.equalToSuperview()
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
        saleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.trailing.equalToSuperview().inset(8)
            make.width.equalTo(49)
            make.height.equalTo(18)
        }
        saleView.addSubview(saleLabel)
        saleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
