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
        .decorated(with: .image(Constants.mainImageViewImage))
    private let likeView = UIView()
    private let allPhotoView = UIView()
    private let nameLabel = UILabel()
        .decorated(with: .font(.sf(.subheadline([.bold]))))
        .decorated(with: .text(Constants.nameLabel))
        .decorated(with: .textColor(.black))
        .decorated(with: .multiline)
    private let priceLabel = UILabel()
        .decorated(with: .font(.sf(.caption12([.bold]))))
        .decorated(with: .text(Constants.priceLabel))
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

    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupUI()
        setupLayout()
    }

}

// MARK: - Private functions

private extension Page2ViewController {
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.topItem?.title = .emptyLine
    }
    
    func setupUI() {
        mainImageView
            .decorated(with: .backgroundColor(.gray4))
            .decorated(with: .cornerRadius(LayoutConstants.corner10))
        likeView
            .decorated(with: .backgroundColor(.gray10))
            .decorated(with: .cornerRadius(LayoutConstants.corner10))
        bottomView
            .decorated(with: .backgroundColor(.blue4))
            .decorated(with: .cornerRadius(LayoutConstants.corner20))
    }
    
    func setupLayout() {
        [mainImageView, likeView, allPhotoView, nameLabel, priceLabel, descriptionLabel, reitingView, colorLabel, colorView, bottomView].forEach { view.addSubview($0) }
        
        mainImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(-LayoutConstants.insert3)
            make.trailing.equalToSuperview().inset(LayoutConstants.insert52)
            make.top.equalToSuperview().offset(LayoutConstants.offset70)
            make.height.equalTo(LayoutConstants.height279)
        }
        
        likeView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(LayoutConstants.insert34)
            make.top.equalToSuperview().offset(LayoutConstants.offset226)
            make.height.equalTo(LayoutConstants.height95)
            make.width.equalTo(LayoutConstants.width42)
        }
        makeLikeAndSomthingView()
        
        allPhotoView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(mainImageView.snp.bottom).offset(LayoutConstants.offset30)
            make.height.equalTo(LayoutConstants.height50)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(LayoutConstants.offset24poin87)
            make.top.equalTo(allPhotoView.snp.bottom).offset(LayoutConstants.offset25)
            make.width.equalTo(LayoutConstants.width110)
        }
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(LayoutConstants.insert23point7)
            make.top.equalTo(allPhotoView.snp.bottom).offset(LayoutConstants.offset25)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(LayoutConstants.offset24poin39)
            make.trailing.equalToSuperview().inset(LayoutConstants.insert156point64)
            make.top.equalTo(nameLabel.snp.bottom).offset(LayoutConstants.offset16)
        }
        reitingView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(LayoutConstants.offset24)
            make.height.equalTo(LayoutConstants.height10)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(LayoutConstants.offset13point57)
        }
        makeReitingView()
        
        colorLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(LayoutConstants.offset24poin35)
            make.top.equalTo(reitingView.snp.bottom).offset(LayoutConstants.offset15poin93)
        }
        colorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(LayoutConstants.offset25)
            make.top.equalTo(colorLabel.snp.bottom).offset(LayoutConstants.offset12point91)
            make.height.equalTo(LayoutConstants.height24)
        }
        makeColorView()
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(colorView.snp.bottom).offset(LayoutConstants.offset20)
        }
        makeBottomView()
    }
    
    func makeBottomView() {
        let title = UILabel()
            .decorated(with: .font(.sf(.caption9([.bold]))))
            .decorated(with: .text(Constants.titleQuanity))
            .decorated(with: .textColor(.gray3))
        let minus = UIImageView()
            .decorated(with: .image(Constants.minus))
            .decorated(with: .tinColor(.white))
        let plus = UIImageView()
            .decorated(with: .image(Constants.plus))
            .decorated(with: .tinColor(.white))
        let buttonView = UIView()
            .decorated(with: .backgroundColor(.blue1))
            .decorated(with: .cornerRadius(LayoutConstants.corner15))
        let viewMunis = UIView()
            .decorated(with: .backgroundColor(.blue1))
            .decorated(with: .cornerRadius(LayoutConstants.corner10))
        let plusView = UIView()
            .decorated(with: .backgroundColor(.blue1))
            .decorated(with: .cornerRadius(LayoutConstants.corner10))
        
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
            make.leading.equalToSuperview().offset(LayoutConstants.offset23poin3)
            make.top.equalToSuperview().offset(LayoutConstants.offset17poin7)
        }
        viewMunis.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(LayoutConstants.offset24)
            make.top.equalTo(title.snp.bottom).offset(LayoutConstants.offset11point67)
            make.width.equalTo(LayoutConstants.width38poin21)
            make.height.equalTo(LayoutConstants.height22)
        }
        plusView.snp.makeConstraints { make in
            make.leading.equalTo(viewMunis.snp.trailing).offset(LayoutConstants.offset20poin79)
            make.top.equalTo(title.snp.bottom).offset(LayoutConstants.offset11point67)
            make.width.equalTo(LayoutConstants.width38poin21)
            make.height.equalTo(LayoutConstants.height22)
        }
        buttonView.snp.makeConstraints { make in
            make.leading.equalTo(plusView.snp.trailing).offset(LayoutConstants.offset60)
            make.top.equalToSuperview().offset(LayoutConstants.offset19)
            make.trailing.equalToSuperview().inset(LayoutConstants.offset23)
            make.height.equalTo(LayoutConstants.height44)
        }
        
        let heshLabel = UILabel()
            .decorated(with: .font(.sf(.caption8([.bold]))))
            .decorated(with: .text(Constants.descriptionAdd))
            .decorated(with: .textColor(.gray13))
        let addLabel = UILabel()
            .decorated(with: .font(.sf(.caption8([.bold]))))
            .decorated(with: .text(Constants.addToCart))
            .decorated(with: .textColor(.white))
        buttonView.addSubview(heshLabel)
        buttonView.addSubview(addLabel)
        
        heshLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(LayoutConstants.offset29poin85)
            make.top.equalToSuperview().offset(LayoutConstants.offset19poin04)
        }
        addLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(LayoutConstants.insert30point51)
            make.top.equalToSuperview().offset(LayoutConstants.offset19poin04)
        }
        
    }
    
    func makeColorView() {
        let viewWhite = UIView()
            .decorated(with: .backgroundColor(.white))
        let viewGray = UIView()
            .decorated(with: .backgroundColor(.gray12))
        let viewBlack = UIView()
            .decorated(with: .backgroundColor(.black))

        [viewWhite, viewGray, viewBlack].forEach { view in
            view.layer.borderWidth = LayoutConstants.borderWidth2
            if view == viewWhite {
                view.layer.borderColor = UIColor.gray12.cgColor
            } else {
                view.layer.borderColor = view.backgroundColor?.cgColor
            }
            view.layer.cornerRadius = LayoutConstants.corner10
        }
        [viewWhite, viewGray, viewBlack].forEach { colorView.addSubview($0) }
        viewWhite.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.equalTo(LayoutConstants.height24)
            make.width.equalTo(LayoutConstants.width32)
        }
        viewGray.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(viewWhite.snp.trailing).offset(LayoutConstants.offset15)
            make.height.equalTo(viewWhite.snp.height)
            make.width.equalTo(viewWhite.snp.width)
        }
        viewBlack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(viewGray.snp.trailing).offset(LayoutConstants.offset15)
            make.height.equalTo(viewWhite.snp.height)
            make.width.equalTo(viewWhite.snp.width)
        }
        
    }
    
    func makeReitingView() {
        let star = UIImageView()
            .decorated(with: .image(Constants.starImage))
            .decorated(with: .tinColor(.yelow1))
        let price = UILabel()
            .decorated(with: .font(.sf(.caption7([.bold]))))
            .decorated(with: .text(Constants.sumReviews))
            .decorated(with: .textColor(.black))
        let review = UILabel()
            .decorated(with: .font(.sf(.caption8([.bold]))))
            .decorated(with: .text(Constants.reviews))
            .decorated(with: .textColor(.gray3))
        
        reitingView.addSubview(star)
        star.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        reitingView.addSubview(price)
        price.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset1)
            make.leading.equalTo(star.snp.trailing).offset(LayoutConstants.offset3poin41)
        }
        reitingView.addSubview(review)
        review.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset1)
            make.leading.equalTo(price.snp.trailing).offset(LayoutConstants.offset3poin72)
        }
    }
    
    func makeLikeAndSomthingView() {
        let like = UIImageView()
            .decorated(with: .image(Constants.likeImage))
            .decorated(with: .tinColor(.blue3))
        let another = UIImageView()
            .decorated(with: .image(Constants.anotherImage))
            .decorated(with: .tinColor(.blue3))
        let lineView = UIView()
            .decorated(with: .backgroundColor(.blue3))
        
        likeView.addSubview(like)
        like.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset17)
            make.centerX.equalToSuperview()
        }
        likeView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset46poin5)
            make.height.equalTo(LayoutConstants.offset1)
            make.width.equalTo(LayoutConstants.width11poin18)
            make.centerX.equalToSuperview()
        }
        likeView.addSubview(another)
        another.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(LayoutConstants.offset17)
            make.centerX.equalToSuperview()
        }
    }
    
}

// MARK: - Constants

private extension Page2ViewController {
    
    enum Constants {
        static let descriptionLabel = "Features waterproof, fire, air resistant shoes. all changed when the country of fire attacked"
        static let letcolorLabel = "Color:"
        static let nameLabel = "New balance Sneakers"
        static let mainImageViewImage = UIImage(named: "bigPhoto")
        static let priceLabel = "$ 22,50"
        static let titleQuanity = "Quanity:"
        static let addToCart = "ADD TO CART"
        static let descriptionAdd = "#2,500"
        static let reviews = "(4000 reviews)"
        static let sumReviews = "3.9"
        static let minus = UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 9, weight: .bold))
        static let plus = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 9, weight: .bold))
        static let anotherImage = UIImage(systemName: "scale.3d",
                                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .bold))
        static let likeImage = UIImage(systemName: "heart",
                                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .bold))
        static let starImage = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 9.5, weight: .semibold))
    }
    
}
