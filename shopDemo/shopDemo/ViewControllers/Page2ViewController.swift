//
//  Page2ViewController.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import UIKit
import SnapKit

class Page2ViewController: UIViewController {
    
    var viewModel: Page2ViewModel!
    
    // MARK: - Private

    // MARK: UI
    
    private let mainImageView = UIImageView()
        .decorated(with: .image(UIImage(named: "bigPhoto")))
    private let likeView = UIView()
    private let allPhotoView = UIView()
    private let nameLabel = UILabel()
        .decorated(with: .font(.sf(.subheadline([.bold]))))
        .decorated(with: .text("New balance Sneakers"))
        .decorated(with: .textColor(.black))
        .decorated(with: .multiline)
    private let priceLabel = UILabel()
        .decorated(with: .font(.sf(.caption12([.bold]))))
        .decorated(with: .text("$ 22,50"))
        .decorated(with: .textColor(.black))
    private let descriptionLabel = UILabel()
        .decorated(with: .font(.sf(.caption10([.bold]))))
        .decorated(with: .text(Constants.descriptionLabel))
        .decorated(with: .textColor(.gray3))
        .decorated(with: .multiline)
    private let reitingView = UIView()
    private let colorLabel = UILabel()
        .decorated(with: .font(.sf(.caption8([.bold]))))
        .decorated(with: .text(Constants.letcolorLabel))
        .decorated(with: .textColor(.gray11))
    private let colorView = UIView()
    private let bottomView = UIView()

    override func loadView() {
        super.loadView()

        setupView()
        setupUI()
        setupLayout()
    }

}

// MARK: - Private functions

private extension Page2ViewController {
    
    func setupView() {
        
    }
    
    func setupUI() {
        mainImageView.backgroundColor = .gray4
        mainImageView.layer.cornerRadius = 10
        likeView.backgroundColor = .gray10
        likeView.layer.cornerRadius = 10
        allPhotoView.backgroundColor = .gray1
        bottomView.backgroundColor = .blue4
        bottomView.layer.cornerRadius = 20
    }
    
    func setupLayout() {
        [mainImageView, likeView, allPhotoView, nameLabel, priceLabel, descriptionLabel, reitingView, colorLabel, colorView, bottomView].forEach { view.addSubview($0) }
        
        mainImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(-3)
            make.trailing.equalToSuperview().inset(52)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(279)
        }
        
        likeView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(34)
            make.top.equalToSuperview().offset(226)
            make.height.equalTo(95)
            make.width.equalTo(42)
        }
        makeLikeAndSomthingView()
        
        allPhotoView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(mainImageView.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24.87)
            make.top.equalTo(allPhotoView.snp.bottom).offset(25)
            make.width.equalTo(110)
        }
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(23.7)
            make.top.equalTo(allPhotoView.snp.bottom).offset(25)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24.39)
            make.trailing.equalToSuperview().inset(156.64)
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
        }
        reitingView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(24)
            make.height.equalTo(10)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(13.57)
        }
        makeReitingView()
        
        colorLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24.35)
            make.top.equalTo(reitingView.snp.bottom).offset(15.93)
        }
        colorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(25)
            make.top.equalTo(colorLabel.snp.bottom).offset(12.91)
            make.height.equalTo(24)
        }
        makeColorView()
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(colorView.snp.bottom).offset(20)
        }
        makeBottomView()
    }
    
    func makeBottomView() {
        let title = UILabel()
            .decorated(with: .font(.sf(.caption9([.bold]))))
            .decorated(with: .text("Quanity:"))
            .decorated(with: .textColor(.gray3))
        let minus = UIImageView().decorated(with: .image(UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 9, weight: .bold))))
        let plus = UIImageView().decorated(with: .image(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 9, weight: .bold))))
        plus.decorated(with: .tinColor(.white))
        minus.decorated(with: .tinColor(.white))
        
        let buttonView = UIView()
        buttonView.backgroundColor = .blue1
        buttonView.layer.cornerRadius = 15
        
        
        let viewMunis = UIView()
        let plusView = UIView()
        viewMunis.backgroundColor = .blue1
        plusView.backgroundColor = .blue1
        viewMunis.layer.cornerRadius = 10
        plusView.layer.cornerRadius = 10
        viewMunis.addSubview(minus)
        minus.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        plusView.addSubview(plus)
        plus.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        [title, viewMunis, plusView, buttonView].forEach { bottomView.addSubview($0) }
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24.3)
            make.top.equalToSuperview().offset(17.07)
        }
        viewMunis.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(title.snp.bottom).offset(11.67)
            make.width.equalTo(38.21)
            make.height.equalTo(22)
        }
        plusView.snp.makeConstraints { make in
            make.leading.equalTo(viewMunis.snp.trailing).offset(20.79)
            make.top.equalTo(title.snp.bottom).offset(11.67)
            make.width.equalTo(38.21)
            make.height.equalTo(22)
        }
        buttonView.snp.makeConstraints { make in
            make.leading.equalTo(plusView.snp.trailing).offset(60)
            make.top.equalToSuperview().offset(19)
            make.trailing.equalToSuperview().inset(23)
            make.height.equalTo(44)
        }
        
        let heshLabel = UILabel()
            .decorated(with: .font(.sf(.caption7([.bold]))))
            .decorated(with: .text("#2,500"))
            .decorated(with: .textColor(.gray13))
        let addLabel = UILabel()
            .decorated(with: .font(.sf(.caption7([.bold]))))
            .decorated(with: .text("ADD TO CART"))
            .decorated(with: .textColor(.white))
        buttonView.addSubview(heshLabel)
        buttonView.addSubview(addLabel)
        heshLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(29.85)
            make.top.equalToSuperview().offset(19.04)
        }
        addLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30.51)
            make.top.equalToSuperview().offset(19.04)
        }
        
    }
    
    func makeColorView() {
        let viewWhite = UIView()
        viewWhite.backgroundColor = .white
        let viewGray = UIView()
        viewGray.backgroundColor = .gray12
        let viewBlack = UIView()
        viewBlack.backgroundColor = .black

        [viewWhite, viewGray, viewBlack].forEach { view in
            view.layer.borderWidth = 2
            if view == viewWhite {
                view.layer.borderColor = UIColor.gray12.cgColor
            } else {
                view.layer.borderColor = view.backgroundColor?.cgColor
            }
            view.layer.cornerRadius = 10
        }
        [viewWhite, viewGray, viewBlack].forEach { colorView.addSubview($0) }
        viewWhite.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(32)
        }
        viewGray.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(viewWhite.snp.trailing).offset(15)
            make.height.equalTo(24)
            make.width.equalTo(32)
        }
        viewBlack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(viewGray.snp.trailing).offset(15)
            make.height.equalTo(24)
            make.width.equalTo(32)
        }
        
    }
    
    func makeReitingView() {
        let star = UIImageView().decorated(with: .image(UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 9.5, weight: .semibold))))
        star.decorated(with: .tinColor(.yelow1))
        let price = UILabel()
            .decorated(with: .font(.sf(.caption7([.bold]))))
            .decorated(with: .text("3.9"))
            .decorated(with: .textColor(.black))
        let review = UILabel()
            .decorated(with: .font(.sf(.caption8([.bold]))))
            .decorated(with: .text("(4000 reviews)"))
            .decorated(with: .textColor(.gray3))
        
        reitingView.addSubview(star)
        star.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        reitingView.addSubview(price)
        price.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(star.snp.trailing).offset(3.41)
        }
        reitingView.addSubview(review)
        review.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(price.snp.trailing).offset(3.72)
        }
    }
    
    func makeLikeAndSomthingView() {
        let like = UIImageView()
            .decorated(with: .image(UIImage(systemName: "heart",
                                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .bold))))
        let another = UIImageView()
            .decorated(with: .image(UIImage(systemName: "scale.3d",
                                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .bold))))
        
        another.decorated(with: .tinColor(.blue3))
        like.decorated(with: .tinColor(.blue3))
        
        let lineView = UIView()
        lineView.backgroundColor = .blue3
        
        likeView.addSubview(like)
        like.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.centerX.equalToSuperview()
        }
        likeView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(46.5)
            make.height.equalTo(1)
            make.width.equalTo(11.18)
            make.centerX.equalToSuperview()
        }
        likeView.addSubview(another)
        another.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(17)
            make.centerX.equalToSuperview()
        }
    }
    
}

// MARK: - Constants

private extension Page2ViewController {
    
    enum Constants {
        static let descriptionLabel = "Features waterproof, fire, air resistant shoes. all changed when the country of fire attacked"
        static let letcolorLabel = "Color:"
    }
    
}
