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

    private let titleViewCustom = UIView()
    private let profileImageButton = UIButton(type: .custom)
    private let locationView = makeLocetionView()
    private let searchBar = SearchView()
    private let category = CollectionViewPage1()
    private let titleLatest = UILabel()
        .decorated(with: .text(Constants.titleLatest))
        .decorated(with: .font(.sf(.h4([.semibold]))))
    private let viewAll = UILabel()
        .decorated(with: .text(Constants.viewAll))
        .decorated(with: .font(.sf(.caption11([.semibold]))))
        .decorated(with: .textColor(.gray4))
    private let latest = CollectionViewTwoPage1()
    private let titleFlash = UILabel()
        .decorated(with: .text(Constants.titleFlash))
        .decorated(with: .font(.sf(.h4([.semibold]))))
    private let viewAllTwo = UILabel()
        .decorated(with: .text(Constants.viewAll))
        .decorated(with: .font(.sf(.caption11([.semibold]))))
        .decorated(with: .textColor(.gray4))
    private let flash = CollectionViewThreePage1()
    private let brend = UILabel()
        .decorated(with: .text(Constants.brend))
        .decorated(with: .font(.sf(.h4([.semibold]))))
    private let breanAllTwo = UILabel()
        .decorated(with: .text(Constants.viewAll))
        .decorated(with: .font(.sf(.caption11([.semibold]))))
        .decorated(with: .textColor(.gray4))
    private let brends = CollectionViewTwoPage1()
    private let scrolleView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    private let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getAllProduct {
            self.setupCollectionView()
            self.setupCollectionLatesView()
            self.setupCollectionFlashView()
            self.setupCollectionBrendsView()
        }

        setupTitleView()
        setupView()
        setupLayout()
        setupButtonAction()
    }

}

private extension Page1ViewController {

    func setupView() {
        view.decorated(with: .backgroundColor(.mainColor))
        navigationItem.titleView = titleViewCustom
        navigationItem.leftBarButtonItem = makeUIBarButtonItemLeft()
        navigationItem.rightBarButtonItem = makeUIBarButtonItemRight()
        searchBar.delegat = self
        latest.delegate = self
        flash.delegate = self
    }

    func setupLayout() {
        [locationView, searchBar, category, scrolleView].forEach { view.addSubview($0) }

        locationView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(LayoutConstants.insert23)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(LayoutConstants.width50)
            make.height.equalTo(LayoutConstants.height8)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(locationView.snp.bottom).offset(LayoutConstants.offset10poin91)
            make.trailing.leading.equalToSuperview().inset(LayoutConstants.insert56)
            make.height.equalTo(LayoutConstants.height24)
        }
        category.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(LayoutConstants.offset17)
            make.trailing.leading.equalToSuperview().inset(LayoutConstants.insert15)
            make.height.equalTo(LayoutConstants.height65)
        }
        scrolleView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(LayoutConstants.insert11)
            make.top.equalTo(category.snp.bottom).offset(LayoutConstants.offset34poin5)
            make.bottom.equalToSuperview()
        }
        setupLayoutScrollView()
    }

    func setupLayoutScrollView() {
        scrolleView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
            make.height.equalTo(LayoutConstants.height680)
        }

        [titleLatest, viewAll, latest, titleFlash, viewAllTwo, flash, brend, breanAllTwo, brends].forEach { contentView.addSubview($0) }

        titleLatest.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(LayoutConstants.insert11poin55)
        }
        viewAll.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset2)
            make.trailing.equalToSuperview().inset(LayoutConstants.insert12poin92)
        }
        latest.snp.makeConstraints { make in
            make.top.equalTo(titleLatest.snp.bottom).offset(LayoutConstants.offset10)
            make.leading.equalToSuperview().inset(LayoutConstants.offset10)
            make.trailing.equalToSuperview()
            make.height.equalTo(LayoutConstants.height150)
        }
        titleFlash.snp.makeConstraints { make in
            make.top.equalTo(latest.snp.bottom).offset(LayoutConstants.offset22)
            make.leading.equalToSuperview().inset(LayoutConstants.insert11poin55)
        }
        viewAllTwo.snp.makeConstraints { make in
            make.top.equalTo(latest.snp.bottom).offset(LayoutConstants.offset26)
            make.trailing.equalToSuperview().inset(LayoutConstants.insert12poin92)
        }
        flash.snp.makeConstraints { make in
            make.top.equalTo(titleFlash.snp.bottom).offset(LayoutConstants.offset8poin86)
            make.leading.trailing.equalToSuperview().inset(LayoutConstants.insert10)
            make.height.equalTo(LayoutConstants.height221)
        }
        brend.snp.makeConstraints { make in
            make.top.equalTo(flash.snp.bottom).offset(LayoutConstants.offset22)
            make.leading.equalToSuperview().inset(LayoutConstants.insert11poin55)
        }
        breanAllTwo.snp.makeConstraints { make in
            make.top.equalTo(flash.snp.bottom).offset(LayoutConstants.offset26)
            make.trailing.equalToSuperview().inset(LayoutConstants.insert12poin92)
        }
        brends.snp.makeConstraints { make in
            make.top.equalTo(breanAllTwo.snp.bottom).offset(LayoutConstants.offset10)
            make.leading.equalToSuperview().inset(LayoutConstants.insert10)
            make.trailing.equalToSuperview()
            make.height.equalTo(LayoutConstants.height150)
        }
    }

    func setupCollectionView() {
        category.setup(with: viewModel.arrayCategory)
    }

    func setupCollectionFlashView() {
        flash.setup(with: viewModel.arrayFlash)
    }

    func setupCollectionLatesView() {
        latest.setup(with: viewModel.arrayLatest)
    }

    func setupCollectionBrendsView() {
        brends.setup(with: viewModel.arrayBrand)
    }

    static func makeSearchView() -> UIView {
        let view = UIView()
            .decorated(with: .backgroundColor(.gray5))
            .decorated(with: .cornerRadius(LayoutConstants.corner12))
        let image = UIImageView(image: Constants.search)
        view.addSubview(image)

        image.snp.makeConstraints { make in
            make.width.height.equalTo(LayoutConstants.width12)
            make.top.equalToSuperview().offset(LayoutConstants.offset5poin5)
            make.trailing.equalToSuperview().inset(LayoutConstants.insert17poin5)
        }

        let textfield = UITextField()
            .decorated(with: .textColor(.gray4))
            .decorated(with: .font(.sf(.caption8())))
            .decorated(with: .placeholder(Constants.textField))
            .decorated(with: .alignment(.center))

        view.addSubview(textfield)
        textfield.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(LayoutConstants.insert29point5)
            make.leading.equalToSuperview().offset(LayoutConstants.offset10)
        }

        return view
    }

    func setupButtonAction() {
        profileImageButton.addAction(for: .touchUpInside) { [weak self] _ in
            self?.viewModel.goToProfile()
        }
    }

    func setupTitleView() {
        let fullTitle = UIView()
        let leftPartTitle = UILabel()
            .decorated(with: .text(Constants.leftPartTitle))
            .decorated(with: .font(.sf(.h5([.bold]))))
        let rightPartTitle = UILabel()
            .decorated(with: .text(Constants.rightPartTitle))
            .decorated(with: .font(.sf(.h5([.bold]))))
            .decorated(with: .textColor(.blue2))
        
        fullTitle.addSubview(leftPartTitle)
        fullTitle.addSubview(rightPartTitle)
        leftPartTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-LayoutConstants.insert3)
            make.leading.equalToSuperview().inset(-LayoutConstants.insert5)
        }
        rightPartTitle.snp.makeConstraints { make in
            make.top.equalTo(leftPartTitle.snp.top)
            make.leading.equalTo(leftPartTitle.snp.trailing).offset(LayoutConstants.offset5)
        }
        titleViewCustom.addSubview(fullTitle)
        fullTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(LayoutConstants.width132)
            make.height.equalTo(LayoutConstants.height19)
        }
    }

    func setupRightButtonPhoto() {
        profileImageButton.frame = CGRect(x: 0.0, y: 0, width: 31, height: 29)
        profileImageButton.layer.borderWidth = 1
        profileImageButton.layer.borderColor = UIColor.borderColor2.cgColor
        profileImageButton.layer.cornerRadius = profileImageButton.frame.width / 2
        profileImageButton.imageView?.contentMode = .scaleAspectFill
    }

    func makeUIBarButtonItemRight() -> UIBarButtonItem {
        setupRightButtonPhoto()

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 29))
        view.bounds = view.bounds.offsetBy(dx: 0, dy: 0)
        view.addSubview(profileImageButton)

        let rightPhoto = UIBarButtonItem(customView: view)
        rightPhoto.customView?.widthAnchor.constraint(equalToConstant: LayoutConstants.width51).isActive = true
        rightPhoto.customView?.heightAnchor.constraint(equalToConstant: LayoutConstants.height29).isActive = true

        return rightPhoto
    }

    func makeUIBarButtonItemLeft() -> UIBarButtonItem {
        let buttonLeft = UIButton()
            .decorated(with: .image(Constants.buttonLeftImage))
        buttonLeft.heightAnchor.constraint(equalToConstant: LayoutConstants.height24).isActive = true
        buttonLeft.widthAnchor.constraint(equalToConstant: LayoutConstants.width22).isActive = true
        buttonLeft.contentHorizontalAlignment = .left

        let button = UIBarButtonItem(customView: buttonLeft)
        return button
    }

    static func makeLocetionView() -> UIView {
        let view = UIView()
        let title = UILabel()
            .decorated(with: .text(Constants.locationTitle))
            .decorated(with: .textColor(.gray4))
            .decorated(with: .font(.sf(.caption8())))
        let image = UIImageView()
            .decorated(with: .image(Constants.arrowDoun))

        view.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.leading.equalTo(title.snp.trailing).offset(LayoutConstants.offset1)
            make.top.equalToSuperview().offset(LayoutConstants.offset2)
            make.width.equalTo(LayoutConstants.width9)
            make.height.equalTo(LayoutConstants.height7)
        }

        return view
    }

    func makePage2ViewModel(
        _ model: CollectionViewTwoPage1.Model? = nil,
        _ model2: CollectionViewThreePage1.Model? = nil) -> Page2ViewModel.Model {
        var item = Page2ViewModel.Model()
        if let product = model {
            item.name = product.name
            item.image = product.image
            item.prise = product.prise
        } else if let product = model2 {
            item.name = product.name
            item.image = product.image
            item.prise = product.prise
        }

        return item
    }

}

// MARK: CollectionViewTwoPage1Delegate

extension Page1ViewController: CollectionViewTwoPage1Delegate {

    func actionCollectionView(_ model: CollectionViewTwoPage1.Model) {
        viewModel.openPage2(product: makePage2ViewModel(model, nil))
    }

}

extension Page1ViewController: CollectionViewThreePage1Delegate {

    func actionCollectionTwoView(_ model: CollectionViewThreePage1.Model) {
        viewModel.openPage2(product: makePage2ViewModel(nil, model))
    }

}

extension Page1ViewController: SearchViewProtocol {

    func changesTextFild(text: String?) {
        guard let text else { return }

        viewModel.sendTextTextField(text: text)
    }

}

// MARK: - Constants

private extension Page1ViewController {

    enum Constants {
        static let leftPartTitle = "Trade by"
        static let rightPartTitle = "bata"
        static let locationTitle = "Location"
        static let buttonLeftImage = UIImage(named: "clip.pdf")
        static let titleLatest = "Latest"
        static let viewAll = "View all"
        static let titleFlash = "Flash Sale"
        static let brend = "Brends"
        static let arrowDoun = UIImage(named: "arrowDoun")
        static let textField = "What are you looking for?"
        static let search = UIImage(named: "searchMy.pdf")
    }

}
